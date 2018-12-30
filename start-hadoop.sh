#!/bin/bash
#export HADOOP_HOME=/mnt/d/hadoop-3.1.0
BASE_DIR=/mnt/d/data-platform
export HADOOP_HOME=${BASE_DIR}/hadoop-2.7.6
export HADOOP_LOG_DIR=${BASE_DIR}/log/hadoop
export HADOOP_CONF_DIR=${BASE_DIR}/etc/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export LOCALHOST=localhost:9000
export HADOOP_SSH_OPTS="-p 2200"
cat > $HADOOP_CONF_DIR/core-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://${LOCALHOST}</value>
    </property>
</configuration>
EOF
cat > $HADOOP_CONF_DIR/hdfs-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>/mnt/h/hadoop/dfs/name</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>/mnt/h/hadoop/dfs/data</value>
    </property>
</configuration>
EOF
cat > $HADOOP_CONF_DIR/mapred-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
</configuration>
EOF
cat > $HADOOP_CONF_DIR/hadoop-env.sh <<EOF
export JAVA_HOME=${JAVA_HOME}
export HADOOP_LOG_DIR=${BASE_DIR}/log/hadoop
export HADOOP_CONF_DIR=${BASE_DIR}/etc/hadoop
EOF
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR  namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
