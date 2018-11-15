#!/bin/bash

subscription-manager register --username=$RHN_USERNAME --password=$RHN_PASSWORD

subscription-manager attach --pool=$POOL_ID

subscription-manager repos --disable='*'

subscription-manager repos --enable=rhel-7-server-rpms
subscription-manager repos --enable=rhel-7-server-extras-rpms

yum install -y wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct

yum update -y

yum install -y docker-1.13.1

yum install -y nfs-utils nfs-utils-lib portmap

subscription-manager unsubscribe --all
subscription-manager unregister
subscription-manager clean

reboot