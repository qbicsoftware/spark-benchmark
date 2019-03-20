[![Build Status](https://travis-ci.com/qbicsoftware/spark-benchmark.svg?branch=master)](https://travis-ci.com/qbicsoftware/spark-benchmark)
# Spark-Benchmark
This repository contains various infrastructure experiments and benchmarks for Apache Spark. It is under heavy construction.

# Setting up a local network and running an example on all workers
Build Base, Master, Worker and Submit Dockerfiles 
```bash
./build-images.sh 
```     
This provides the Docker Images:    
qbic/spark:latest_base    
qbic/spark:latest_master    
qbic/spark:latest_worker    
qbic/spark:latest_submit

Run docker-compose. This sets up the network and adds a number of workers (here 3).
```bash
docker-compose up --scale spark-worker=3
```

Verify that the network is up. Visit localhost:8080 and
```bash
docker network ls
```

Launch a new instance as the driver.
```bash
docker run --rm -it --network spark-benchmark_spark-network qbic/spark:latest_submit /bin/sh
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

# Running a custom program from a local file system
To access the local file system a volume has to be mounted for spark to be able to access the program.    
Place your program which you want to access from the driver into an isolated folder, say: /mnt/spark-apps .           
Launch your driver instance using the *-v* option to mount the volume /path/to/volume:/path/to/mount/to . Imagine there's a python script pi.py in /mnt/spark-apps:    
```bash
docker run --rm -it --network spark-benchmark_spark-network -v /mnt/spark-apps:/opt/spark-apps qbic/spark:latest_submit /bin/sh
```

You should now be able to find your script from the driver instance in /opt/spark-apps:    
```bash
ls /opt/spark-apps
```

Now you can submit your script to the cluster to run it:
```bash
/spark/bin/spark-submit --master spark://spark-master:7077 /opt/spark-apps/pi.py 1000
```

Analogous to above your job should now run and calculate Pi. You can always verify that it ran on all workers using the web UI on localhost:8080 .

Moreover, you should find example bash scripts for job submissions [here](spark-submit).

# Logs
All log files (stdout and stderr) can be viewed on localhost:8080 by clicking on either the completed job and then the specific worker or by accessing the specific worker directly from the front page.



