#!/usr/bin/env python3
# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

import datetime
import xlwt
import re
import os


root_folder = '/mnt/c/win_works/win_logs/audio_deplay/result'

trace_log = os.path.join(root_folder, '2023-05-09_21_54.log')
hci_csv = os.path.join(root_folder, '2023-05-09_21_54.csv')
output_file = os.path.join(root_folder, '2023-05-09_21_54.xls')

stamp_length = len("1683587078.791")


def stampfmt(stamp_str):
    time_obj = datetime.datetime.strptime(
        stamp_str, '%Y/%m/%d %H:%M:%S.%f')
    timestamp_obj = datetime.datetime.timestamp(time_obj)
    return str(timestamp_obj)


def hcistampfmt(stamp_str):
    time_obj = datetime.datetime.strptime(
        stamp_str, '%Y/%m/%d %H:%M:%S.%f')
    timestamp_obj = datetime.datetime.timestamp(time_obj)
    return str(timestamp_obj)[:stamp_length]


def parse_trace_log(filename):
    regex = r'^(?P<time>[0-9:\.]+).*(?P<module>(bluego|media|blueware)+).*(?P<point>(after|before)+)\s+(?P<frame>[0-9]+)'

    with open(filename, 'r') as f:
        buffer = f.read()

    timestamp_prefix = datetime.datetime.today().strftime("%Y/%m/%d")

    pattern = re.compile(regex, flags=re.MULTILINE)
    result = pattern.findall(buffer)
    #  output = [(stampfmt(timestamp_prefix + ' ' + x[0]), x[1], x[3], x[5])
    #            for x in result]
    output = [(x[5], x[0], x[1], x[3], stampfmt(
        timestamp_prefix + ' ' + x[0])) for x in result]
    return output


def parse_hci_log(filename):
    with open(filename, 'r') as f:
        buffer = f.read()
    timestamp_prefix = datetime.datetime.today().strftime("%Y/%m/%d")

    regex = r'^(?P<frame>[0-9]+),.*?(?P<timestamp>[0-9\.:]+)",'
    pattern = re.compile(regex, flags=re.MULTILINE)
    result = pattern.findall(buffer)
    output = [(str(int(x[0])-1), x[1], "hci", "after", hcistampfmt(
        timestamp_prefix+' ' + x[1])) for x in result]
    return output


def write_excel(filename, data):
    book = xlwt.Workbook()
    sheet = book.add_sheet("result", cell_overwrite_ok=True)

    for n, i in enumerate(data):
        for x, y in enumerate(i):
            sheet.write(n, x, y)

    book.save(filename)


if __name__ == '__main__':
    trace_res = parse_trace_log(trace_log)
    hci_res = parse_hci_log(hci_csv)
    print(hci_res)

    trace_res.extend(hci_res)

    trace_res.sort()
    write_excel(output_file, trace_res)
