#!/bin/bash

echo "building miner"
cd /miner
apt-get update && apt-get -y install cmake build-essential libboost-all-dev git
git clone -b Linux https://github.com/nicehash/nheqminer.git
cd nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)
