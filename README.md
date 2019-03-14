[![Build Status](https://travis-ci.com/qbicsoftware/spark-benchmark.svg?branch=master)](https://travis-ci.com/qbicsoftware/spark-benchmark)
# Spark-Benchmark
This contains various infrastructure experiments and benchmarks for Apache Spark. This is under heavy construction.

Build Dockerfile and tag with qbic/spark:latest .
```bash
docker build -t qbic/spark:latest . 
```

Run docker-compose .
```bash
docker-compose up --scale spark-worker=3
```

Verify that the network is up. Visit localhost:8080 and
```bash
docker network ls
```

Launch a new instance as the driver. You may have to adapt the network name (could be named differently depending on your path).
```bash
docker run --rm -it --network spark-benchmark_spark-network qbic/spark:latest /bin/sh
```

Run a job on all workers and verifiy that different workers are taking on different jobs.    
We're calculating PI on three workers.
```bash
/spark/bin/spark-submit --master spark://spark-master:7077 --class \
    org.apache.spark.examples.SparkPi \
    /spark/examples/jars/spark-examples_2.11-2.4.0.jar 1000
```
The job should also show up on localhost:8080 as running.

*Pi is roughly 3.141609511416095*    
should be the result

On localhost:8080 you should also see that a job has been completed.
