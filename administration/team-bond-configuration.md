# Network Teaming / Bonding Configuration


```
Example 7. Adding a bonding master and two slave connection profiles

           $ nmcli con add type bond ifname mybond0 mode active-backup
           $ nmcli con add type ethernet ifname eth1 master mybond0
           $ nmcli con add type ethernet ifname eth2 master mybond0

Example 8. Adding a team master and two slave connection profiles

           $ nmcli con add type team con-name Team1 ifname Team1 config team1-master-json.conf
           $ nmcli con add type ethernet con-name Team1-slave1 ifname em1 master Team1
           $ nmcli con add type ethernet con-name Team1-slave2 ifname em2 master Team1

 This example demonstrates adding a team master connection profile and two slaves. It is very similar to the bonding example. The
first command adds a master team profile, naming the team interface and the profile Team1. The team configuration for the master
is read from team1-master-json.conf file. Later, you can change the configuration with modify command (nmcli con modify Team1
team.config team1-master-another-json.conf). The last two commands add slaves profiles, both enslaved to Team1. The first slave
will be bound to em1 interface, the second to em2. The slaves don't specify config and thus teamd will use its default
configuration. You will activate the whole setup by activating both slaves:

             $ nmcli con up Team1-slave1
             $ nmcli con up Team1-slave2

By default, the created profiles are marked for auto-activation. But if another connection has been activated on the device, the
new profile won't activate automatically and you need to activate it manually.
