#!/bin/bash
SPARK_MASTER_URL=spark://spark-master:7077
SPARK_APPLICATION_PATH=/spark/examples/src/main/python/pi.py

docker run --rm -t --network spark-benchmark_spark-network qbic/spark:latest /spark/bin/spark-submit --master $SPARK_MASTER_URL $SPARK_APPLICATION_PATH 1000