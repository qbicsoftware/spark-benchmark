Installation
============

The following sections will guide you through building the required docker images and setting up the spark network.

Obtaining the code
------------------

First, clone the code from Github. Please mind the branches. If you want to work with the latest release always use the master branch.

.. code-block:: bash

    https://github.com/qbicsoftware/spark-service

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

Refer to `usage <usage.html>`_ for detailed instructions about how to run example scripts and your custom programs on the spark network.

