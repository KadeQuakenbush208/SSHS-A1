#!/bin/bash

docker build -t sshs_asg2 -f Dockerfile .
docker run --privileged --name asg2 -v .:/workspace -it sshs_asg2 sh -c "
	echo 'Running original program with input crashes/id:000000...' &&
	./js_asan crashes/id:000000,sig:11,src:000001,time:48164,execs:159600,op:havoc,rep:2 ;
	echo 'Running patched program with input crashes/id:000000...' &&
	./js-patched_asan crashes/id:000000,sig:11,src:000001,time:48164,execs:159600,op:havoc,rep:2
"
