 #!/bin/bash
 
#--class: The entry point for your application (e.g. org.apache.spark.examples.SparkPi)
#--master: The master URL for the cluster (e.g. spark://23.195.26.187:7077)
#--deploy-mode: Whether to deploy your driver on the worker nodes (cluster) or locally as an external client (client) (default: client) †
#--conf: Arbitrary Spark configuration property in key=value format. For values that contain spaces wrap “key=value” in quotes (as shown).
#application-jar: Path to a bundled jar including your application and all dependencies. The URL must be globally visible inside of your cluster, for instance, an hdfs:// path or a file:// path that is present on all nodes.
#application-arguments: Arguments passed to the main method of your main class, if any

# https://spoddutur.github.io/spark-notes/distribution_of_executors_cores_and_memory_for_spark_application.html
# explains how to tune total-executor-cores and more

/spark/bin/spark-submit \
--class ${SPARK_APPLICATION_MAIN_CLASS} \
--master ${SPARK_MASTER_URL} \
--deploy-mode cluster \
--total-executor-cores 1 \
 ${SPARK_SUBMIT_ARGS} \
 ${SPARK_APPLICATION_JAR_LOCATION} \
 ${SPARK_APPLICATION_ARGS} \