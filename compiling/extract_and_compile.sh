#!/usr/bin/env bash

#Extracts the contents of the tar archive NthPrime.tgz into the current directory.
tar -zxf NthPrime.tgz

#Goes into the NthPrime directory that the tar extraction created.
cd NthPrime || exit

#Compile the C program.
gcc ./*.c -o NthPrime

#Call the resulting executable.
./NthPrime "$1"
