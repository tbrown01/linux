# Time Setup (NTP & Chrony)

**NTP (Network Time Protocol)** is a networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks.

For RHEL 5 and 6, NTP is the default package used for time synchronization.

For RHEL 7 and 8 Chrony is the default package used for time synchronization.

**NOTE:** Use either Chrony or NTP but not both on a Linux system.  **Chrony** is the suggested package to use for RHEL 7 and up.

## Chrony Client-Side Setup

```
yum install -y chrony

systemctl enable chronyd && systemctl start chronyd

echo "server ntp.example.com iburst" >> /etc/chrony.conf

systemctl restart chronyd
```

## NTP Client-Side Setup

```
yum install -y ntp

systemctl enable ntpd && systemctl start ntpd

echo "server ntp.example.com iburst" >> /etc/ntp.conf

systemctl restart ntpd
```
