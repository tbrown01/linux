# Red Hat Subscriptions

 The products installed on Red Hat Enterprise Linux 7, including the operating system itself, are covered by subscriptions.
A subscription to Red Hat Content Delivery Network is used to track:

- Registered systems
- Products installed on those system
- Subscriptions attached to those product 

## Red Hat Client Installation

1.  Enable Repo to install Subscription Mananger.
2.  Install the Katello Agent on Client.
3.  Bootstrap Client to Satellite Server.
4.  Enable Red Hat Satellite Tools Yum Repo.
```
yum --enablerepo=RHEL7_UPDATES install subscription-manager -y

rpm -Uvh --force http://redhatsatellite.example.com/pub/katello-ca-consumer-latest.noarch.rpm

subscription-manager register --org="EXAMPLE-PROD" --activationkey="RHEL7-Act-Key"

subscription-manager repos --enable=rhel-\*-satellite-tools-\*-rpms'
```
