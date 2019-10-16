# Yum Repositories

Create a **.repo file** in the **/etc/yum.repos.d/** directory to setup a remote repository.
```
[root@station1]# cat /etc/yum.repo.d/RHCSA.repo

[YUM-REPO]
name=Yum Repository
baseurl= http://station01.example.com/pub/rhel/7.5/
enabled=1
gpgcheck=0

[root@station1]# yum clean all  && yum repolist
```

## Yum Commands
```
yum clean all                       # Clears cache in /var/cache/yum

yum repolist                        # List enabled yum repositories

yum install -y httpd                # Installs httpd package

yum remove -y httpd                 # Removes httpd package

yum update -y                       # Updates all packages 

yum list | grep httpd               # Searches yum repository for httpd package

yum whatprovides */http.conf*       # Provides package associated with the httpd.conf

yum update-minimal --security -y    # Applies security updates from Red Hat Satellite
```
