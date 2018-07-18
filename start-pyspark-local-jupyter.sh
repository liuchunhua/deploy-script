#!/bin/bash
export HADOOP_HOME=/mnt/d/hadoop-2.7.6
export SPARK_HOME=/mnt/d/spark-2.3.0-bin-hadoop2.7

export SPARK_LOCAL_IP=10.186.106.173
export PATH=/mnt/d/liu/miniconda3/bin:$PATH
cd /mnt/d/stations-analysis
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser" ${SPARK_HOME}/bin/pyspark  > jupyter.log 2>&1 &


