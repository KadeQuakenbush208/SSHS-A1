FROM ubuntu:24.04

# TODO: Modify me if needed
ENV AFL_SKIP_CPUFREQ=0

# Copying in the target program source code
RUN mkdir /target
COPY js.c /target

# TODO: Complete this Dockerfile.
# Carry out all necessary steps to clone, build, and install AFL++,
# and compile the target js.c for fuzzing with AFL++
RUN apt-get update
RUN apt-get install -y build-essential python3-dev automake cmake git flex bison libglib2.0-dev libpixman-1-dev python3-setuptools cargo
RUN apt-get install -y lld-14 llvm-14 llvm-14-dev clang-14 || sudo apt-get install -y lld llvm llvm-dev clang
RUN apt-get install -y gcc-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-plugin-dev libstdc++-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-dev

# Clone AFL++
RUN git clone https://github.com/AFLplusplus/AFLplusplus
WORKDIR "/AFLplusplus"
# Build AFL++
RUN make source-only
# Install AFL++
RUN make install

# Compile js.c
WORKDIR "/target"
RUN afl-cc -ggdb -O0 js.c -o js_afl