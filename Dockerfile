FROM ubuntu:16.04
MAINTAINER Timo Taskinen <timo.taskinen@iki.fi>

RUN apk update && apk add --no-cache cmake build-base boost-dev

RUN cd /opt; git clone -b Linux https://github.com/nicehash/nheqminer.git \
 && cd /opt/nheqminer/cpu_xenoncat/Linux/asm/; sh assemble.sh \
 && cd /opt/nheqminer/Linux_cmake/nheqminer_cpu; cmake .; make -j $(nproc)

ENTRYPOINT /opt/nheqminer/Linux_cmake/nheqminer_cpu/nheqminer_cpu
