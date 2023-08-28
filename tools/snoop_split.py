#!/usr/bin/env python3.8
import os
import sys
import logging

'''

Tefau截取的HciTrace.cfa有可能包含多个Sniffer
导致使用蓝牙协议解析工具只能解析第一个Sniffer Log

* 依据Sniffer log 的File Header将HciTrace.cfa拆分成独立的Sniffer Log 
* 检查每个单独的Sniffer Log中是否存在破损包
* 依据HCI Reset将拆分的HCI进行拼接
* 添加btsnoop文件头


SNOOP FILE FORMAT:

    FILE_HEADER
    Packet1
    Packet2
    Packet3
    ......
    PacketX


FILE_HEADER:
    8 bytes identification "btsnoop"
    4 bytes version
    4 bytes datelink type

PacketX:
    4 bytes original length
    4 bytes include length
    4 bytes packet flags
    4 bytes Cumulate drops
    8 bytes TimeStamp
    N bytes Packet Data
'''

FORMAT = '%(asctime)-15s %(levelname)s %(name)s %(message)s'
logging.basicConfig(format=FORMAT,level=logging.INFO)
log = logging.getLogger(__name__)

hci_reset = b"\x01\x03\x0c\x00"
snoop_header = b"\x62\x74\x73\x6e\x6f\x6f\x70\x00\x00\x00\x00\x01\x00\x00\x03\xea"

snoop_header_size = 16
HCI_RESET_POSITION = 0x20+8
HCI_RESET_SIZE = 4


header_offset = 16

pkt_org_len_field_offset = 0
pkt_org_len_field_size = 4

pkt_inc_len_field_offset = 4
pkt_inc_len_field_size = 4

pkt_flag_field_offset = 8
pkt_flag_field_size = 4

pkt_cumulative_field_begin = 12
pkt_cumulative_field_size = 4

pkt_timestamp_field_begin = 16
pkt_timestamp_field_size = 8

pkt_data_field_offset = 24


def is_start_with_hci_reset(content):
    # first hci packet start at 24 bytes
    # Check if first packet is "HCI_REST"
    return True if content[pkt_data_field_offset:].startswith(hci_reset) else False

def is_start_with_snoop_header(content):
    return content.startswith(snoop_header)

class SnoopJointer:
    def __init__(self, location=""):
        self.raws = []
        self.folder = location
        self.joint_grp = dict()
        self.log = logging.getLogger(__class__.__name__)
        pass

    def append(self, snoop_raw):
        self.raws.append(snoop_raw)
        pass

    def joint(self):
        '''
        Splited snoop file may not start with hci_reset packet.
        Try to joint them to the snoop file which start with hci_reset
        '''
        def is_start_with_hci_reset(content):
            '''
            First hci packet start at 24 bytes
            Check if first packet is "HCI_REST"
            '''
            self.log.info("conent head: {}".format(
                content[:HCI_RESET_POSITION+HCI_RESET_SIZE].hex(' ', 1)))
            return True if content[HCI_RESET_POSITION:].startswith(hci_reset) else False

        def remove_header(content=bytes()):
            '''
            Remove snoop file header
            '''
            return content[16:]

        joint_name =""
        joint_content = bytes()

        for i, x in enumerate(self.raws):
            self.log.info("================== {} joint =====================".format(i))
            if i == 0:
                if is_start_with_hci_reset(x):
                    self.log.info("{} snoop start with HCI reset".format(i))
                else:
                    self.log.info(
                        "{} Snoop not start with HCI reset".format(i))

                joint_content = x
                joint_name = str(i)
            else:
                if is_start_with_hci_reset(x):
                    self.log.info("{} snoop start with HCI reset".format(i))
                    self.joint_grp.update({joint_name:joint_content})
                    joint_name = str(i)
                    joint_content = x
                else:
                    self.log.info(
                        "{} Snoop not start with HCI reset,joint to pervious".format(i))
                    joint_content += remove_header(x)
                    joint_name += str(i)

        self.joint_grp.update({joint_name:joint_content})

    def output(self):
        self.log.info(self.joint_grp.keys())
        for key,value in self.joint_grp.items():
            try:
                with open(os.path.join(self.folder, "joint_{}.cfa".format(key)), "wb") as f:
                    f.write(value)
            except Exception as error:
                self.log.error(error)
                self.log.error("{} split with content {}".format(key, value[:20]))
                    
    def process(self):
        self.joint()
        self.output()


class SnoopPaser:
    '''

    '''

    def __init__(self, filename="", raw=bytes()):
        self.raw = raw 
        self.packets = []
        self.total_len = 0
        self.curr_posi = 0
        self.packet_count = 0
        self.filename = filename
        self.log = logging.getLogger(__class__.__name__)

    def get_raw(self):
        if(len(self.raw)>0):
            self.log.info("raw: {}".format(self.raw[:snoop_header_size].hex(" ", 1)))
        else:
            with open(self.filename, 'rb') as f:
                self.raw = f.read()

        if  is_start_with_snoop_header(self.raw):
            self.curr_posi += snoop_header_size
        
        self.total_len = len(self.raw)

    def get_packet(self):

        self.log.debug("packet {} start at curr_posi {}".format(
            self.packet_count, self.curr_posi))

        def get_field_var(offset=0, size=0):
            if (self.curr_posi + offset+size) > self.total_len:
                raise RuntimeError("Value field not completed")

            return int.from_bytes(self.raw[self.curr_posi+offset:self.curr_posi + offset + size], byteorder='big', signed=False)

        def get_field_data(offset=0, size=0):
            if (self.curr_posi+offset+size) > self.total_len:
                self.log.debug("curr_posi({}) + offset({}) +size({}) > total({})".format(
                    self.curr_posi, offset, size, self.total_len))
                raise RuntimeError("Data Field not completed, Discard")

            return self.raw[self.curr_posi+offset:self.curr_posi + offset+size]

        def append_pkt(pkt={}):
            self.packets.append(pkt)
            self.packet_count += 1

        org_len = get_field_var(
            pkt_org_len_field_offset, pkt_org_len_field_size)

        inc_len = get_field_var(
            pkt_inc_len_field_offset, pkt_inc_len_field_size)

        timestap = get_field_var(
            pkt_inc_len_field_offset, pkt_inc_len_field_size)

        data = get_field_data(pkt_data_field_offset, inc_len)

        if (org_len != inc_len):
            self.log.info(
                "Org Length:{}, include length:{}".format(org_len, inc_len))

        append_pkt({'olen': org_len, 'ilen': inc_len,
                   'ts': timestap, 'data': data})

        return pkt_data_field_offset + inc_len

    def process(self):
        try:
            self.get_raw()
            while (self.curr_posi < self.total_len-1):
                self.curr_posi += self.get_packet()
        except Exception as e:
            self.log.error("")
            self.log.error(
                "====================    error     ====================")
            self.log.error("")
            self.log.error(e)
            self.log.error(
                "Data since {} bytes Discard".format(self.curr_posi))
            self.log.error("extract packat count {}".format(self.packet_count))
            self.log.error("current possition: {}".format(self.curr_posi))
            self.log.error("total length: {}".format(self.total_len))
            self.log.error("{} bytes left".format(
                self.total_len - self.curr_posi))
            self.log.error("raw content: {}".format(
                self.raw[self.curr_posi:self.curr_posi+20].hex(' ', 1)))
            pass
        finally:
            self.raw = self.raw[:self.curr_posi]
            self.log.info("")
            self.log.info(
                "====================    result    ====================")
            self.log.info("")
            self.log.info("{} packet extract".format(self.packet_count))
            return self.raw


class HciTrace:
    '''
    Input: Tefau's HciTrace
    Actions:
        * Insert Snoop File if necessary.
        * Split Snoop file to seperated snoop file.
    '''

    def __init__(self, filename) -> None:
        self.filename = filename
        self.raw = bytes()
        self.snoop_raw_grp = []
        self.joint_snoop_content = []
        self.log = logging.getLogger(__class__.__name__)
        pass

    def split(self):
        '''
        Orignal HCI Trace log may include several snoop file,
        which is started with "snoop_header"
        Divid it to seperated snoop fil
        '''
        before = self.raw

        while (len(before) > 0):
            before, header, after = before.rpartition(snoop_header)
            self.log.debug("split:")
            self.log.debug("head:{}".format(header.hex(' ', 1)))
            self.log.debug("after:{}".format(after[:20].hex(' ', 1)))
            self.snoop_raw_grp.append(header+after)

        self.snoop_raw_grp.reverse()

    def get_hcitrace_raw(self):

        def check_trace_start_with_snoop_header(raw=bytes()):
            '''Check if the HCI trace has snoop file header'''
            return raw.startswith(snoop_header)

        with open(self.filename, 'rb') as f:
            raw = f.read()

        if check_trace_start_with_snoop_header(raw):
            self.raw = raw
        else:
            self.log.error("MISS SNOOP Header")
            self.log.error("File Start With:".format(
                raw[:snoop_header_size].hex(' ', 1)))
            self.raw = snoop_header+raw

    def output(self):
        folder = os.path.dirname(os.path.abspath(self.filename))

        for i, x in enumerate(self.snoop_raw_grp):
            with open(os.path.join(folder, "single_{}.cfa".format(i)), 'wb') as f:
                f.write(x)

    def process(self):
        self.get_hcitrace_raw()
        self.split()
        self.output()
        #  self.make_joint_hci_sniffer()
        #  self.save_sniffer_log()


def main_entry(filepath):
    folder = os.path.dirname(os.path.abspath(filepath))
    jointer = SnoopJointer(location=folder)

    hci_trace = HciTrace(filepath)
    hci_trace.process()


    for i, x in enumerate(hci_trace.snoop_raw_grp):
        print("SnoopParser Processing {} split".format(i))
        snoop = SnoopPaser(raw=x)
        jointer.append(snoop.process())
    
    jointer.process()


if __name__ == '__main__':

    if len(sys.argv) != 2:
        print("please input the HCI file name ")
        exit(1)

    param = sys.argv[1]
    main_entry(param)
    #  self.log.info(hci_reset.hex())
    pass
