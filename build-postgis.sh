#!/bin/bash
GEOS_BUILD=/mnt/d/geos_build
POSTGIS_BUILD=/mnt/d/postgis-2.4.4
GEOS_PREFIX=/mnt/d/geos
POSTGIS_PREFIX=/mnt/d/postgis
POSTGRESQL=/mnt/d/postgresql
 sudo apt install libproj-dev libproj9 libgeos-3.5.0 libgeos-c1v5 libhdf5-dev libjson-c-dev libxml2-utils proj-data libgdal-dev
if [ ! -e /mnt/d/geos-3.6.3 ]; then
tar -C /mnt/d/ -xjf /mnt/i/geos-3.6.2.tar.bz2
fi
if [ ! -e $GEOS_BUILD ]; then
mkdir $GEOS_BUILD
fi
cd $GEOS_BUILD
#make clean
#../geos-3.6.2/configure --prefix=$GEOS_PREFIX
#make -j4
#make install
if [ ! -e $POSTGIS_BUILD ]; then
tar -C /mnt/d/ -xzf /mnt/i/postgis-2.4.4.tar.gz
fi
cd $POSTGIS_BUILD
make clean
./configure --prefix=$POSTGIS_PREFIX --with-pgconfig=$POSTGRESQL/bin/pg_config --with-geosconfig=$GEOS_PREFIX/bin/geos-config
make -j4
make install
