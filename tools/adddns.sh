#!/bin/bash

GATEWAY=`ip route | awk '/default/{print $3}'`

sudo touch /etc/resolv.conf

if [ -z "`awk '/${GATEWAY}/{print $2}' /etc/resolv.conf`" ];then
    echo "nameserver ${GATEWAY}" | sudo tee -a /etc/resolv.conf > /dev/null
fi

if [ -z "`awk '/114.114.114.114/{print $2}' /etc/resolv.conf`" ];then
    echo "nameserver 114.114.114.114" | sudo tee -a /etc/resolv.conf > /dev/null
fi

if [ -z "`awk '/search/{print $1}' /etc/resolv.conf`" ];then
    
    set -euo pipefail

    # Gets the global DNS domain of the computer as well as the DNS search suffix domains of all
    # individual network interfaces, deduplicates any entries and formats them in a single line
    DNSSEARCH=$(/mnt/c/windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoLogo -NoProfile -Command \
      "[System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName; \
      [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces().GetIPProperties().DnsSuffix" \
      | tr -d '\r' | uniq | tr -s '\n' ' ')

    echo "Will set search domains: ${DNSSEARCH}"

    echo "search ${DNSSEARCH}" | sudo tee -a /etc/resolv.conf > /dev/null
else
    echo "Already has search domain"
fi
