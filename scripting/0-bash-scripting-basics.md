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
