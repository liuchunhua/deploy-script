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
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
    <property>
	<name>mapreduce.map.memory.mb</name>
	<value>512</value>
    </property>	
    <property>
	<name>mapreduce.reduce.memory.mb</name>
	<value>512</value>
    </property>	
</configuration>
EOF
cat > $HADOOP_HOME/etc/hadoop/yarn-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
    <property>
        <name>yarn.nodemanager.vmem-check-enabled</name>
        <value>false</value>
    </property>
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
$HADOOP_HOME/sbin/start-yarn.sh
