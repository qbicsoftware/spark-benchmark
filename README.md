# Configuring the Spark network
For the following section we assume that we are working on a machine with 64 cores and 128 gigabytes of RAM.     
The configuration for the worker nodes can be found [here](env/spark-worker.sh). Commonly one uses only a single worker node per machine, since each worker spins up its own JVM.    
Since the change [SPARK-1706 Allow multiple executors per worker in Standalone mode](https://issues.apache.org/jira/browse/SPARK-1706) in Spark 1.4 it’s currently possible to start multiple executors in a single JVM process of a worker.
To launch multiple executors on a machine you start multiple standalone workers, each with its own JVM. It introduces unnecessary overhead due to these JVM processes, provided that there are enough cores on that worker. If you are running Spark in standalone mode on memory-rich nodes it can be beneficial to have multiple worker instances on the same node as a very large heap size has two disadvantages:    
- Garbage collector pauses can hurt throughput of Spark jobs.    
- Heap size of >32 GB can’t use CompressedOoops. So 35 GB is actually less than 32 GB.    
To explore the effects of providing multiple cores or using multiple workers on your standalone Spark cluster you can run the PI example from above with different parameters settings.    
You can for example run it with 64 workers using 1 core each or with 1 worker using 64 cores. You will quickly notice that the 64 workers will have an advantage on the standalone cluster, since they're less prone to GC pauses. Moreover, the number of executor cores per worker and the overall executor cores can be limited using the following options:
```bash
--executor-cores 1
--total-executor-cores 2
```
You can resubmit your job now:
```bash
/spark/bin/spark-submit --master spark://spark-master:7077 --class org.apache.spark.examples.SparkPi --executor-cores 1 --total-executor-cores 2 /spark/examples/jars/spark-examples_2.11-2.4.0.jar 5000
```
You could notice severe performance improvements, since executors won't try to use other worker's cores.

# Logs
All log files (stdout and stderr) can be viewed on localhost:8080 by clicking on either the completed job and then the specific worker or by accessing the specific worker directly from the front page.





