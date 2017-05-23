FROM alpine:latest

RUN apk update && apk add --no-cache cmake build-base boost-dev git

RUN git clone -b Linux https://github.com/nicehash/nheqminer.git \
 && cd /nheqminer/cpu_xenoncat/Linux/asm/; sh assemble.sh \
 && cd /nheqminer/Linux_cmake/nheqminer_cpu; cmake .; make -j $(nproc)

RUN apk del --purge cmake build-base git

ENTRYPOINT /nheqminer/Linux_cmake/nheqminer_cpu/nheqminer_cpu
