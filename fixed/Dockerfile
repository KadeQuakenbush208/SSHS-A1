FROM ubuntu:24.04

ENV AFL_SKIP_CPUFREQ=0

# Copying in the target program source code
RUN mkdir /target
COPY js.c /target
COPY js.patch /target
COPY /crashes /target/crashes

# Install necessary libraries etc.
RUN apt-get update
RUN apt-get install -y build-essential python3-dev automake cmake git flex bison libglib2.0-dev libpixman-1-dev python3-setuptools cargo
RUN apt-get install -y lld-14 llvm-14 llvm-14-dev clang-14 || sudo apt-get install -y lld llvm llvm-dev clang
RUN apt-get install -y gcc-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-plugin-dev libstdc++-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-dev

WORKDIR "/target"
# Compile js.c with AddressSanitizer
RUN gcc -fsanitize=address -ggdb -O0 js.c -o js_asan
# Create a patched version of js.c
RUN cp js.c js-patched.c
RUN patch js-patched.c < js.patch
# Compile the patched js.c with AddressSanitizer
RUN gcc -fsanitize=address -ggdb -O0 js-patched.c -o js-patched_asan
