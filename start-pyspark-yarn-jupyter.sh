#!/bin/bash
export HADOOP_HOME=/mnt/d/hadoop-2.7.6
export SPARK_HOME=/mnt/d/spark2-2.6.4.0-91 
export HDP_VERSION="2.6.4.0-91"

export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop

export SPARK_LOCAL_IP=10.186.106.173
export PATH=/mnt/d/linux-anaconda3/bin:$PATH
cd /mnt/d/stations-analysis
export PYSPARK_PYTHON=./ANACONDA/python3/bin/python 
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser" \
	${SPARK_HOME}/bin/pyspark --executor-cores 1 --master yarn --num-executors 4 \
	--driver-memory 4G --executor-memory 1G --conf spark.ui.port=10101 --conf spark.yarn.queue='default'  \
        --conf spark.yarn.jars=hdfs://ambari.master.com:8020/jars/* \
	--conf spark.driver.extraJavaOptions="-Dhdp.version=current" \
	--conf spark.yarn.am.extraJavaOptions="-Dhdp.version=current" \
	--conf spark.driver.extraClassPath="/mnt/d/hive-client/lib/*" \
	--conf spark.executor.extraClassPath="/usr/hdp/current/hbase-client/lib/*" \
	--archives hdfs://ambari.master.com:8020/python3.zip#ANACONDA \
	--jars /mnt/d/sqldeveloper/jdbc/lib/postgresql-42.2.4.jar,/mnt/d/sqldeveloper/jdbc/lib/ojdbc8.jar,/mnt/d/sqldeveloper/jdbc/lib/mysql-connector-java-8.0.11.jar,/mnt/d/sqldeveloper/jdbc/lib/db2jcc4-10.1.jar \
#	> jupyter.log 2>&1 &
