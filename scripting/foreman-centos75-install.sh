#!/bin/bash

# Install Repositories

yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/3.12/katello/el7/x86_64/katello-repos-latest.rpm
yum -y localinstall https://yum.theforeman.org/releases/1.22/el7/x86_64/foreman-release.rpm
yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install foreman-release-scl

# Install Katello

yum -y update
yum -y install katello

# Set Foreman to Use System Ruby

rvm use system

# Install Foreman

foreman-installer --scenario "katello" --foreman-initial-organization "DTV" --foreman-initial-location "MSDC" --foreman-proxy-dhcp "false" --foreman-proxy-dns "false" --foreman-proxy-tftp "true" --foreman-proxy-puppet "true" --foreman-proxy-puppetca "true" --foreman-puppetrun "true" --foreman-proxy-puppetrun-provider "ssh" --puppet-runinterval "3600"
