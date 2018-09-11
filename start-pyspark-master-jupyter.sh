#!/bin/bash
export HADOOP_HOME=/mnt/d/hadoop-2.7.6
export SPARK_HOME=/mnt/d/spark-2.3.1-bin-hadoop2.7

export SPARK_LOCAL_IP=10.186.106.173
export PATH=/mnt/d/linux-anaconda3/bin:$PATH
cd /mnt/d/stations-analysis
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser" ${SPARK_HOME}/bin/pyspark --executor-cores 2 --master spark://10.180.29.73:7077 > jupyter.log 2>&1 &
# PYSPARK_DRIVER_PYTHON=ipython ${SPARK_HOME}/bin/pyspark --master spark://10.180.29.73:7077


