#!/bin/bash

POSTGRESQL=/mnt/d/postgresql
TIMESCALEDB_BUILD=/mnt/d/timescaledb_build
export PATH=$POSTGRESQL/bin:$PATH
if [ ! -d $TIMESCALEDB_BUILD ]; then
	mkdir $TIMESCALEDB_BUILD
	cd $TIMESCALEDB_BUILD
	tar -xzf /mnt/h/timescaledb-0.11.0.tar.gz
fi
./bootstrap
cd build && make -j4 && make install

