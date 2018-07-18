#!/bin/bash
export HADOOP_HOME=/mnt/d/hadoop-2.7.6
export HADOOP_LOG_DIR=$HOME/hadoop/logs
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export LOCALHOST=localhost:9000
export HADOOP_SSH_OPTS="-p 2200"
$HADOOP_HOME/sbin/stop-dfs.sh
