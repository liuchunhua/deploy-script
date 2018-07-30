#!/bin/bash
POSTGRES_BUILD=/mnt/d/postgresql-10.4
POSTGRES=/mnt/d/postgresql
PYTHPATH=/mnt/d/linux-anaconda3
if [ ! -e $POSTGRES_BUILD ]; then
tar -C /mnt/d/ -xzf /mnt/i/postgresql-10.4.tar.gz
fi
cd $POSTGRES_BUILD
../postgresql-10.4/configure --prefix=$POSTGRES --with-extra-version=custom --with-includes=$PYTHPATH/include --with-libraries=$PYTHPATH/lib --with-pythona --without-readline
make -j4
make install

