#!/bin/bash

ip_addr=`ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d '/' -f 1`
hostname=`hostname`

case $hostname in
    "master")
        master_ip=$ip_addr
        ;;
    "slave1")
        master_ip=`echo $ip_addr | awk -F '.' '{ printf "%d.%d.%d.%d\n", $1,$2,$3,$4-1}'`
        ;;
    "slave2")
        master_ip=`echo $ip_addr | awk -F '.' '{ printf "%d.%d.%d.%d\n", $1,$2,$3,$4-2}'`
        ;;
    "slave3")
        master_ip=`echo $ip_addr | awk -F '.' '{ printf "%d.%d.%d.%d\n", $1,$2,$3,$4-3}'`
        ;;
    *)
        exit 0
        ;;
esac

ip=$master_ip
for h in master slave1 slave2 slave3; do
    if ! grep -q $h /etc/hosts; then
        echo -e "$ip\t$h" >> /etc/hosts
    fi
    ip=`echo $ip | awk -F '.' '{ printf "%d.%d.%d.%d\n", $1,$2,$3,$4+1 }'`
done
