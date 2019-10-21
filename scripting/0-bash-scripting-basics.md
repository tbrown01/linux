# Bash Scripting Basics
**SHA-BANG** The sha-bang ( #!) [6] at the head of a script tells your system that this file is a set of commands to be fed to the command interpreter indicated. 
```
#!/bin/bash
#!/usr/local/python
```
**PERMISSIONS** To run the command you must give it the executable permission.
```
# chmod 755 scriptname
# chmod +rx scriptname
```
**RUN SCRIPT** To run the command from the current directory.
```
#  sh scriptname
# ./scriptname
```
**NOTE:** Move script to the **/usr/local/bin (as root)**, to make the script available to everyone. The script could then be invoked by simply typing **scriptname [ENTER]** from the command-line.

### Variables and Parameters

An essential feature of programming is the ability to use a name or a label to refer to some other quantity: such as a value, or a command. This is commonly referred to as variables.
```
domain='http://www.whitehouse.gov'
path='/some/path'
base_url="$domain$path"
page='index.html'
# download http://www.whitehouse.gov/some/path/index.html
# and save to 'downloads/index.html'
curl "$base_url/$page" -o "downloads/$page"
```
