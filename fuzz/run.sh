#!/bin/bash

docker build -t sshs_asg1 -f Dockerfile .
winpty docker run --privileged --name asg1 -v .:/workspace -it sshs_asg1 sh -c "echo core > /proc/sys/kernel/core_pattern && afl-fuzz -i in -o out -- ./js_afl @@"
