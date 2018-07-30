export SPARK_HOME=/mnt/d/spark-2.3.1-bin-hadoop2.7
export SPARK_MASTER_HOST=10.186.106.173
export SPARK_MASTER_PORT=7077
export SPARK_MASTER_WEBUI_PORT=8080
#Standby Masters with ZooKeeper
./start-zk.sh
export SPARK_DAEMON_JAVA_OPTS="-Dspark.deploy.recoveryMode=ZOOKEEPER -Dspark.deploy.zookeeper.url=127.0.0.1:2181 -Dspark.deploy.zookeeper.dir=$HOME/zookeeper"
export SPARK_WORKER_CORES=2
export SPARK_WORKER_DIR=${HOME}/spark/work
export SPARK_WORKER_WEBUI_PORT=8081
export SPARK_LOCAL_DIRS=/mnt/h/spark_store
export SPARK_LOG_DIR=${HOME}/spark/logs
export SPARK_LOCAL_IP=10.186.106.173
${SPARK_HOME}/sbin/start-master.sh --webui-port ${SPARK_MASTER_WEBUI_PORT}

export PATH=/mnt/d/liu/miniconda3/bin:$PATH
source activate consumewaste
${SPARK_HOME}/sbin/start-slave.sh --cores ${SPARK_WORKER_CORES} --memory 2G --work-dir ${SPARK_WORKER_DIR} spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT}
