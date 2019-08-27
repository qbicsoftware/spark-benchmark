#!/bin/sh
SPARK_MASTER_URL=spark://spark-master:7077
SPARK_APPLICATION_JAR_LOCATION=/opt/spark-apps/pi_2.12-2.4.1.jar
SPARK_APPLICATION_MAIN_CLASS=org.apache.spark.SparkPi

target=/mnt/spark-apps/
# folder non-empty?
if [ "$(find "$target" -mindepth 1 -print -quit 2>/dev/null)" ]; then
    docker run --rm -t --network spark-service_spark-network -v /mnt/spark-apps:/opt/spark-apps qbic/spark:latest_submit \
    /spark/bin/spark-submit --master $SPARK_MASTER_URL --class $SPARK_APPLICATION_MAIN_CLASS $SPARK_APPLICATION_JAR_LOCATION 1000
else
    echo "Target '$target' is empty or not a directory"
fi





