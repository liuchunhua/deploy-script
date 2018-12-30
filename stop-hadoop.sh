#!/bin/bash
BASE_DIR=/mnt/d/data-platform
export HADOOP_HOME=$BASE_DIR/hadoop-2.7.6
export HADOOP_LOG_DIR=$BASE_DIR/log/hadoop
export HADOOP_CONF_DIR=${BASE_DIR}/etc/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export LOCALHOST=localhost:9000
export HADOOP_SSH_OPTS="-p 2200"
$HADOOP_HOME/sbin/stop-dfs.sh
