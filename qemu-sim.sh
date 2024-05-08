#!/bin/bash

# Quick little bash script to avoid typing the same arguments all the time

# base specs are covered by the -machine option
# MEMSIZE = 4G
# CORES = 4

# I am not currently including serial / -nographic or anything, since
# we might want to have visual output at some point
OTHER_FLAGS="-nographic -S -s"

if [ $# -lt 1 ]; then
    echo "You need to supply a kernel image as an argument. It's probably called kernel8.img"
elif [ -r $1 ]; then
    # file exists and is readable
    echo "Recall that you can exit nographic with C-A x"
    qemu-system-aarch64 -machine raspi4b ${OTHER_FLAGS} -kernel $1
else
    echo "Supplied file doesn't exist or isn't readable."
fi
