# Foreman Katello (3.12) Installation on CentOS 7.5
This guides walks you through a basic installation of the the open source Foreman/Katello on CentOS 7.5. Documentation can be found on the Foreman website.

## Install Required Repositories
```
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/3.12/katello/el7/x86_64/katello-repos-latest.rpm
yum -y localinstall https://yum.theforeman.org/releases/1.22/el7/x86_64/foreman-release.rpm
yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install foreman-release-scl
```
## Katello 3.12 Installation
```
yum install -y katello
```
### Ruby System Setup (Optional)
If following **foreman-installer --list-scenarios** provides below error, you will need to run the  **rvm use system** command to tell Foreman to use the system Ruby.
```
~]# foreman-installer --list-scenarios
/usr/local/rvm/rubies/ruby-2.4.1/lib/ruby/site_ruby/2.4.0/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- kafo (LoadError)
        from /usr/local/rvm/rubies/ruby-2.4.1/lib/ruby/site_ruby/2.4.0/rubygems/core_ext/kernel_require.rb:55:in `require'
        from /sbin/foreman-installer:3:in `<main>'
        
~]# rvm use system
```

## Foreman Installation (with options)
```
foreman-installer --scenario "katello" --foreman-initial-organization "CORP" --foreman-initial-location "LADC" --foreman-proxy-dhcp "false" --foreman-proxy-dns "false" --foreman-proxy-tftp "true" --foreman-proxy-puppet "true" --foreman-proxy-puppetca "true" --foreman-puppetrun "true" --foreman-proxy-puppetrun-provider "ssh" --puppet-runinterval "3600"
```
