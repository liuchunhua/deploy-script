#!/bin/bash
export ZOOKEEPER_HOME=/mnt/d/zookeeper-3.4.12
cat > $ZOOKEEPER_HOME/conf/zoo.cfg <<EOF
ticktime=2000
dataDir=$HOME/zookeeper
clientPort=2181
EOF
$ZOOKEEPER_HOME/bin/zkServer.sh start
