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

A positional parameter is a variable within a shell program; its value is set from an argument specified on the command line. Positional parameters are numbered and are referred to with a preceding ``$'': $1, $2, $3, etc.
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
## Test Operators

The square brackets ( [ ] ) in the if statement above are actually a reference to the command test. This means that all of the operators that test allows may be used here as well. Look up the man page for test to see all of the possible operators (there are quite a few) but some of the more common ones are listed below.

 **Test Operators** | **Description** |
|         ---:|     :---     |
| **-n STRING** |     The length of STRING is greather than zero.  |
| **-z STRING** |     The length of STRING is zero (i.e. it is empty.  |
| **STRING1 = STRING2** | STRING1 is equal to STRING2 |
| **STRING1 != STRING2** | STRING1 is not equal to STRING2 |
| **INTEGER1 -eq INTEGER2** | INTEGER1 is numerically equal to INTEGER2 |
| **INTEGER1 -gt INTEGER2** | INTEGER1 is numerically not equal to INTEGER2 |
| **INTEGER1 -lt INTEGER2** | INTEGER1 is numerically less equal to INTEGER2 |
| **-e FILE** |  File exists |
| **-d FILE** |  File exists and is a directory |
| **-r FILE** |  File exists and the read permission is granted |
| **-s FILE** |  File exists and it's size is greater than zero (i.e. it is not empty) |
| **-w FILE** |  File exists and the write permission is granted  |
| **-x FILE** |  File exists and the execute permission is granted  |
| **! EXPERSSION** |  The EXPRESSION is False  |


## Boolean Opeation

Sometimes we only want to do something if multiple conditions are met. Other times we would like to perform the action if one of several condition is met. We can accommodate these with boolean operators.

- **and - &&**
- **or - ||**
```
#!/bin/bash

if [ -r $1 ] && [ -s $1 ] 
   then
      echo This file is useful.
fi

if [ $USER == 'bob' ] || [ $USER == 'andy' ] 
   then
      ls -alh
fi
```
## For Loops
	
**For Loops** says for each of the items in a given list, perform the given set of commands. The for loop will take each item in the list (in order, one after the other), assign that item as the value of the variable var, execute the commands between do and done then go back to the top, grab the next item in the list and repeat over.

The list is defined as a series of strings, separated by spaces.

## While Loops

The bash **while loop** is a control flow statement that allows code or commands to be executed repeatedly based on a given condition. For example, run echo command 5 times or read text file line by line or evaluate the options passed on the command line for a script.
```
#!/bin/bash
x=1
while [ $x -le 5 ]
do
  echo "Welcome $x times"
  x=$(( $x + 1 ))
done
```
## Heredoc

A **here script** (also sometimes called a here document) is an additional form of I/O redirection. It provides a way to include content that will be given to the standard input of a command. In the case of the script above, the standard input of the cat command was given a stream of text from our script.
```
~]$ cat << EOF > /home/user/file.txt
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF

~]$ ssh -T user@host.examplem.com << EOF
echo "The current local working directory is: $PWD"
echo "The current remote working directory is: \$PWD"
EOF
```
##  Case Statements

With complex scripts sometimes using a series of if and elif statements can grow to be unwieldy. Fortunately a case statement can make things cleaner. It's a little hard to explain so here are some examples to illustrate:
```
#!/bin/bash

case ${1} in
start)
    echo "starting"
    ;;
stop)
    echo "stopping"
    ;;
*)
    echo "option not valid"
esac
```

## Functions

Think of a function as a small script within a script. It's a small chunk of code which you may call multiple times within your script. They are useful if you have certain tasks which need to be performed several times. Instead of writing out the same code over and over you may write it once in a function then call that function every time.Functions are called, triggered, simply by invoking their names. A function call is equivalent to a command.

```
#!/bin/bash

function showdate(){
   date +%F
}

function showtime() {
   date +%r
}

function mailadmin() {
   echo “Script Ran Successful” | mail –s “Success Script Execution” root
}

showdate
showtime
mailadmin

```


## GetOps (Get Options)
The getopts command in a script is the name of a Unix program for parsing command line arguments in shell scripts (i.e. some_script.sh -h -u) 
```
#!/bin/bash

usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${s}" ] || [ -z "${p}" ]; then
    usage
fi

echo "s = ${s}"
echo "p = ${p}"
```

