#!/bin/bash

# Usage: ./config-network 192.168.56.118/24 192.168.1.1 centos7-vm118

nmcli con add con-name enp0s8 ifname enp0s8 type ethernet ip4 $1 gw4 $2  
nmcli con mod enp0s8 ipv4.method manual  
nmcli con mod enp0s8 connection.autoconnect yes  
nmcli con mod enp0s3 connection.autoconnect yes  
nmcli con mod enp0s8 ipv4.dns "8.8.8.8 8.8.4.4"

nmcli con down enp0s3; nmcli con up enp0s3  
nmcli con down enp0s8; nmcli con up enp0s8

hostnamectl set-hostname $3
