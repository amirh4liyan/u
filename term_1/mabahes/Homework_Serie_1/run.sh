#!/bin/bash
# run
# An script to run last modified c/c++ file in current directory.


VAR_1=$(ls -lt | grep ".c" | awk '{print $9}' | head -n 1)

g++ $VAR_1
./a.out
rm a.out
