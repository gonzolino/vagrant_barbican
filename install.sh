#!/bin/bash
#
# Base installation of a host.
#
# Configures apt sources, clones the devstack repository
# and adds a base configuration to localrc.

echo "
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb-src mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb-src mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb-src mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
deb-src mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" > /etc/apt/sources.list

apt-get update 
apt-get -y install git
git clone https://git.openstack.org/openstack-dev/devstack

echo "ADMIN_PASSWORD=secrete
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD
SERVICE_TOKEN=a682f596-76f3-11e3-b3b2-e716f9080d50
GIT_BASE=https://git.openstack.org
disable_service horizon
disable_service n-net

enable_service neutron
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta

enable_plugin barbican https://review.openstack.org/openstack/barbican" > devstack/localrc

chown -R vagrant:vagrant devstack
