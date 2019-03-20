#!/bin/bash
SPARK_MASTER_URL=spark://spark-master:7077
SPARK_APPLICATION_JAR_LOCATION=/spark/examples/jars/spark-examples_2.11-2.4.0.jar
SPARK_APPLICATION_MAIN_CLASS=org.apache.spark.examples.SparkPi

docker run --rm -t --network spark-benchmark_spark-network qbic/spark:latest_submit \
/spark/bin/spark-submit --master $SPARK_MASTER_URL --class $SPARK_APPLICATION_MAIN_CLASS $SPARK_APPLICATION_JAR_LOCATION 1000