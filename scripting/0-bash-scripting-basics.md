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

## Variables and Parameters

An essential feature of programming is the ability to use a name or a label to refer to some other quantity: such as a value, or a command. This is commonly referred to as variables.

A variable is a placeholder for its value, the data it holds. Referencing (retrieving) its value is called **variable substitution**.
```
domain='http://www.whitehouse.gov'
path='/some/path'
base_url="$domain$path"
page='index.html'

# download http://www.whitehouse.gov/some/path/index.html
# and save to 'downloads/index.html'

curl "$base_url/$page" -o "downloads/$page"
```
**CONSTANTS** As the name variable suggests, the content of a variable is subject to change based on your script. On the other hand, there may be values that, once set, should never be changed. These are called constants. As an example, **Environment Variables** are usually considered constants since they are rarely changed. 
```
# printenv | more

echo $HOSTNAME
echo $PWD
```
## Positional Parameters

A positional parameter is a variable within a shell program; its value is set from an argument specified on the command line that invokes the program. Positional parameters are numbered and are referred to with a preceding ``$'': $1, $2, $3, etc.
```
~]$ ./some_script.sh word1 word2 word3
```
If some_program were a bash shell script, we could read each item on the command line because the positional parameters contain the following:
```
$0 would contain "some_script.sh"
$1 would contain "word1"
$2 would contain "word2"
$3 would contain "word3"
```
## Command Substitution

The standard output of a command can be encapsulated, much like a value can be stored in a value, and then expanded by the shell. This is known as **command substitution**.  This can be done in 2 ways:
1. Enclosing the command with **$( command )**
2. Using backticks: **\` command \`**
```
RIGHT_NOW=$(date +"%x %r %Z")
echo ${RIGHT_NOW}                 (or)

RIGHT_NOW=`date +"%x %r %Z`
echo ${RIGHT_NOW}
```

