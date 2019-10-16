# Basic Setup For New Server

1. Configure Hostname.
2. Configure Static IP Address, DNS, Default Gateway.
3. Bootstrap to Configuration Management Tool (CFEngine, Puppet, Chef, etc).
    - Chrony/NTP configuration
    - Yum Update to latest Packages
    - Bootstrap to Red Hat Satellite.
  
  ## RHEL 7 Basic Configuration
  ```
  hostnamectl set-hostname server01.example.com
  
 Edit file named /etc/sysconfig/network-scripts/ifcfg-eth0 as follows:

DEVICE=eth0
BOOTPROTO=none
ONBOOT=yes
IPADDR=10.0.0.250
NETMASK=255.255.255.0
GATEWAY=10.0.0.254
DNS1=10.0.0.2
DNS2=10.0.0.3
USERCTL=no
```
## CFEngine Boostrap and Client Run

```
/usr/local/sbin/cf-agent -B cfenginehub.example.com

/usr/local/sbin/cf-agent -IC -K           # Runs the CFEngine Agent to Update System
```

 ## RHEL 6 Basic Configuration
 
 Same as above except that you use **/etc/sysconfig/network** to configure hostname.
  ```
  # vim /etc/sysconfig/network
  
  HOSTNAME=server01.example.com
  GATEWAY=10.0.0.254
  ```
  
  Other Network Files of Importance:
  ```
  /etc/hosts                            # Local IP Address to Hostname Resolution
  
  /etc/nsswitch                         # Order Of Hostname Lookup (i.e. files,dns)
  
  /etc/resolve.conf                     # Appends Domain Name to Hostanme and Nameserver
  
  /etc/sysconfig/network                # Configure Hostname and Gateway (Global Config)
  
  /etc/sysconfig/network-scripts/ifcfg-eth0     # IP Configuration for Network Interface.
  ```
