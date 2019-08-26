Installation
============

The following sections will guide you through building the required docker images and setting up the spark network.

Building the docker images
--------------------------

Building the docker images is as easy as running the build-images script, which resides at the toplevel of the repository.

.. code-block:: bash

   ./build-images.sh 


This provides the Docker Images:    
qbic/spark:latest_base    
qbic/spark:latest_master    
qbic/spark:latest_worker    
qbic/spark:latest_submit

Verify that the docker images have been built

.. code-block:: bash

    docker image ls

Run docker-compose. This sets up the network and adds a number of workers (here 3).

.. code-block:: bash

    docker-compose up --scale spark-worker=3

Verify that the network is up. Visit localhost:8080 and

.. code-block:: bash

    docker network ls

Launch a new instance as the driver.

.. code-block:: bash

    docker run --rm -it --network spark-service_spark-network qbic/spark:latest_submit /bin/sh

Refer to `usage <usage.html>`_ for detailed instructions about how to run example scripts and your custom programs on the spark network.



