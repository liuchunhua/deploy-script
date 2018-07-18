#!/bin/bash
#export HADOOP_HOME=/mnt/d/hadoop-3.1.0
export HADOOP_HOME=/mnt/d/hadoop-2.7.6
export HADOOP_LOG_DIR=$HOME/hadoop/logs
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export LOCALHOST=localhost:9000
export HADOOP_SSH_OPTS="-p 2200"
cat > $HADOOP_HOME/etc/hadoop/core-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://${LOCALHOST}</value>
    </property>
</configuration>
EOF
cat > $HADOOP_HOME/etc/hadoop/hdfs-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
EOF
cat > $HADOOP_HOME/etc/hadoop/mapred-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
</configuration>
EOF
if [ ! -e $HADOOP_HOME/etc/hadoop/hadoop-env.sh.old ]; then
	mv $HADOOP_HOME/etc/hadoop/hadoop-env.sh  $HADOOP_HOME/etc/hadoop/hadoop-env.sh.old;
fi
cat > $HADOOP_HOME/etc/hadoop/hadoop-env.sh <<EOF
export JAVA_HOME=${JAVA_HOME}
export HADOOP_LOG_DIR=\$HOME/hadoop/logs
EOF
$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
