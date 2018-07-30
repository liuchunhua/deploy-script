#!/bin/bash
export HADOOP_HOME=/mnt/d/hadoop-2.7.6
export SPARK_HOME=/mnt/d/spark-2.3.1-bin-hadoop2.7

export SPARK_LOCAL_IP=127.0.0.1
export PATH=/mnt/d/linux-anaconda3/bin:$PATH
cd /mnt/d/stations-analysis
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser" ${SPARK_HOME}/bin/pyspark  > jupyter.log 2>&1 &


