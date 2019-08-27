#!/bin/sh
SPARK_MASTER_URL=spark://spark-master:7077
SPARK_APPLICATION_PATH=/opt/spark-apps/pi.py

target=/mnt/spark-apps/
# folder non-empty?
if [ "$(find "$target" -mindepth 1 -print -quit 2>/dev/null)" ]; then
    docker run --rm -t --network spark-service_spark-network -v /mnt/spark-apps:/opt/spark-apps qbic/spark:latest_submit \
    spark/bin/spark-submit --master $SPARK_MASTER_URL $SPARK_APPLICATION_PATH 1000
else
    echo "Target '$target' is empty or not a directory"
fi



