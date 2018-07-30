#!/bin/bash

LD_LIBRARY_PATH=/mnt/d/geos/lib:/mnt/d/postgis/lib:/mnt/d/postgresql/lib
export LD_LIBRARY_PATH
POSTGRESQL_HOME=/mnt/d/postgresql
PATH=$POSTGRESQL_HOME/bin:$PATH
export PATH

DATA_DIR=/mnt/h/postgresql/data
#To initialize a database cluster
if [ ! -d $DATA_DIR ]; then
mkdir -p $DATA_DIR
pg_ctl -D $DATA_DIR initdb
fi
if [ ! -d $POSTGRESQL_HOME/log ]; then
mkdir $POSTGRESQL_HOME/log
fi
pg_ctl stop -l $POSTGRESQL_HOME/log/pg.log -D $DATA_DIR
