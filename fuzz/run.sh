#!/bin/bash

docker build -t sshs_asg1 -f Dockerfile .
winpty docker run --name asg1 -v .:/workspace -it sshs_asg1 afl-fuzz -i in -o out -- ./js_afl @@
