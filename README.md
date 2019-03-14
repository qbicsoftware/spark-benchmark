# spark-experiments

build Dockerfile and tag with qbic/spark:latest
```bash
docker build -t qbic/spark:latest . 
```

run docker-compose
```bash
docker-compose up --scale spark-worker=3
```

verify that the network is up
localhost:8080
and 
docker network -ls


launch a new instance as the driver
you may have to adapt the network name (could be named differently depending on your path)
```bash
docker run --rm -it --network spark_network qbic/spark:latest /bin/sh
```


run a job on all workers, verifiy that different workers are taking on different jobs
we're calculating PI on three workers
```bash
/spark/bin/spark-submit --master spark://spark-master:7077 --class \
    org.apache.spark.examples.SparkPi \
    /spark/examples/jars/spark-examples_2.11-2.4.0.jar 1000
```

Pi is roughly 3.141609511416095
should be the result
