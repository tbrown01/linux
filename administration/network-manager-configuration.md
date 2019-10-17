# NetworkManager Configuration
In Red Hat Enterprise Linux 7, the default networking service is provided by **NetworkManager**, which is a dynamic network control and configuration daemon that attempts to keep network devices and connections up and active when they are available. The traditional **ifcfg type** configuration files are still supported.

There are 3 Main Methods For Configuration:

1. **nmcli** (Network Manager Command Line Interface)
2. **nmtui** (Network Manager Text User Interface)
3. Edit Network Script Files (i.e. **/etc/sysconfig/network-scripts/ifcfg-eth0**)

## NetworkManager CLI Configuration

Verify Network Adapaters Available:
```
~]# nmcli device status
DEVICE  TYPE      STATE      CONNECTION  
eth0    ethernet  connected  System eth0 
lo      loopback  unmanaged  -- 

~]# ll /sys/class/net/
total 0
lrwxrwxrwx. 1 root root 0 Oct 17 03:59 eth0 -> ../../devices/pci0000:00/0000:00:05.0/net/eth0
lrwxrwxrwx. 1 root root 0 Oct 17 03:59 lo -> ../../devices/virtual/net/lo
```
Configure "eth0" interface with static IP address
```
~]# nmcli connection add con-name eth0 ifname eth0 type ethernet ip4 10.0.0.10/24 gw4 10.0.0.254
~]# nmcli connection modify eth0 ipv4.dns 10.0.0.254
~]# nmcli connection modify eth0 ipv4.method manual
~]# nmcli connection modify eth0 connection.autoconnect true

~]# nmcli connection down eth0
~]# nmcli connection up eth0
```
