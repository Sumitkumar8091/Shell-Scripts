#!/bin/bash
# This is a single-line comment

#echo "Hello, world!" # This prints "Hello, world!"

: '
This is a
multi-line comment
'

<<'COMMENT'
This is another
way to add
multi-line comments
COMMENT


name="DevOps Learner"
course="90DaysOfDevOps"

# Using variables with echo to print them
#echo "Hello $name, welcome to the $course journey!"


#read num1
#read num2
# Performing the sum of two variables and storing the result in sum
#sum=$((num1 + num2))
#echo "The sum of $num1 and $num2 is: $sum"
#
# Task 5: Using Built-in Variables
# Built-in bash variables store system-related information.
# Some examples are:
# $USER (current logged-in user), $PWD (current directory), $BASH_VERSION (Bash version)

#echo "Current User: $USER"
#echo "Current Directory: $PWD"
#echo "Bash Version: $BASH_VERSION"
#

ls *.txt
ls *.sh
