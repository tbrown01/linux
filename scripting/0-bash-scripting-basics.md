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

Variables can be displaybed with dollars sign **"$VARIABLE_NAME"** or with dollar sign/curly brackets **${VARIABLE_NAME}**
```
domain='http://www.example.com'
path='/some/path'
base_url="$domain$path"
page='index.html'

echo "${base_url}/${page}"    (or)
echo "$base_url/$page"
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

~]$ ./some_script.sh -yes -no /home/username

$# = 3
$* = -yes -no /home/username
$@ = array: {"-yes", "-no", "/home/username"}
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

## Stdin, Stdout, Stderr

On a Unix-like operating system, the first three file descriptors, by default, are as follows:

| FD # | Type | Description |
| --- | --- | --- |
| FD 0  | STDIN | Standard Input|
| FD 1  | STDOUT | Standard Output|
| FD 2  | STDERR | Standard Error|

You can hide stderr by redirecting standard input and standard output file descriptor to **/dev/null**, the special device in Linux that "goes nowhere" or you can grep off the results:
```
~]$ find / -name '*something*' 2>&1 | grep 'something'

~]$ find / -name '*something*' 2> /dev/null/
```
## If, Then, Else Statements

**If statements** allow us to make decisions in our Bash scripts. They allow us to decide whether or not to run a piece of code based upon conditions that we may set. If statements, combined with loops allow us to make much more complex scripts which may solve larger tasks.
```
#!/bin/bash

if [ "${1}" -ge "18" ]; then
    echo "You may go to the party."

elif [ $2 == 'yes' ]; then
    echo "You may go to the party but be back before midnight."

else
   echo "You may not go to the party."
fi
```

## Boolean Operation OPERATION

Sometimes we only want to do something if multiple conditions are met. Other times we would like to perform the action if one of several condition is met. We can accommodate these with boolean operators.

- **and - &&**
- **or - ||**
```
#!/bin/bash

if [ -r $1 ] && [ -s $1 ] 
   then
      echo This file is useful.
fi
```
```
#!/bin/bash

if [ $USER == 'bob' ] || [ $USER == 'andy' ] 
   then
      ls -alh
   else
      ls
fi
```



```
