#!/bin/bash
SPARK_MASTER_URL=spark://spark-master:7077
SPARK_APPLICATION_JAR_LOCATION=/spark/examples/jars/spark-examples_2.12-2.4.1.jar
SPARK_APPLICATION_MAIN_CLASS=org.apache.spark.examples.SparkPi

docker run --rm -t --network spark-service_spark-network zethson/qbic_spark_submit:latest \
/spark/bin/spark-submit --master $SPARK_MASTER_URL --class $SPARK_APPLICATION_MAIN_CLASS $SPARK_APPLICATION_JAR_LOCATION 1000