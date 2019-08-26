Usage
=====

The following section will guide you through running example scripts, as well as custom scripts.

Running an example script
-------------------------

A few example scripts are already provided by the spark installation. Let's calculate PI using our (three) worker nodes.
While running the job you can observe, that the different workers are taking up different jobs.

.. code-block:: bash

    /spark/bin/spark-submit --master spark://spark-master:7077 \
    --class org.apache.spark.examples.SparkPi \
    /spark/examples/jars/spark-examples_2.11-2.4.0.jar 1000

Visit localhost:8080 using your favorite browser and the job shuold show up as running.
*Pi is roughly 3.141609511416095* should be the result.
On localhost:8080 you should also see that a job has been completed.

Running custom programs
-----------------------

To access the local file system a volume has to be mounted for spark to be able to access the program.
Place your program which you want to access from the driver into an isolated folder, say: /mnt/spark-apps .
Launch your driver instance using the *-v* option to mount the volume /path/to/volume:/path/to/mount/to .
Imagine there's a python script pi.py in /mnt/spark-apps:

.. code-block:: bash

    docker run --rm -it --network spark-service_spark-network \
    -v /mnt/spark-apps:/opt/spark-apps -v /mnt/spark-data:/opt/spark-data \
    qbic/spark:latest_submit /bin/sh

You should now be able to find your script from the driver instance in /opt/spark-apps:    

.. code-block:: bash

    ls /opt/spark-apps

Now you can submit your script to the cluster to run it:

.. code-block:: bash

    /spark/bin/spark-submit --master spark://spark-master:7077 /opt/spark-apps/pi.py 1000

Analogous to above your job should now run and calculate Pi. You can always verify that it ran on all workers using the web UI on localhost:8080 .
Moreover, you should find example bash scripts for job submissions `here <https://github.com/qbicsoftware/spark-service/tree/development/spark-submit>`_.

Logs
----

All log files (stdout and stderr) can be viewed on localhost:8080 by clicking on either the completed job and then the specific worker or by accessing the specific worker directly from the front page.

Head over to `configuration <configuration.html>`_ for information about how to configure the respective nodes and the expected performance.

