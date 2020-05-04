.. image:: https://travis-ci.com/qbicsoftware/spark-service.svg?branch=development
    :target: https://travis-ci.com/qbicsoftware/spark-service
    :alt: Development branch build status
    
.. image:: https://img.shields.io/github/v/release/qbicsoftware/spark-service
    :target: https://img.shields.io/github/v/release/qbicsoftware/spark-service
    :alt: GitHub release (latest by date)
    
.. image:: https://img.shields.io/github/commits-since/qbicsoftware/spark-service/latest
    :target: https://img.shields.io/github/commits-since/qbicsoftware/spark-service/latest
    :alt: GitHub commits since latest release
    
.. image:: https://readthedocs.org/projects/spark-service/badge/?version=latest
    :target: https://spark-service.readthedocs.io/en/latest/?badge=latest
    :alt: Documentation Status

Docker Builds Statuses

.. image:: https://img.shields.io/docker/cloud/automated/zethson/qbic_spark_base
    :target: https://img.shields.io/docker/cloud/automated/zethson/qbic_spark_base
   :alt: Docker Cloud Automated build
   
.. image:: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_base
    :target: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_base
    :alt: Docker Cloud Build Status
    
.. image:: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_master
    :target: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_master
    :alt: Docker Cloud Build Status
    
.. image:: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_worker
    :target: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_worker
    :alt: Docker Cloud Build Status
    
.. image:: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_submit
    :target: https://img.shields.io/docker/cloud/build/zethson/qbic_spark_submit
    :alt: Docker Cloud Build Status

spark-service
=============
spark-service provides a docker based containerized solution for a quick setup of an Apache Spark infrastructure.
It is designed to faciliate benchmarking and interoperability with `scark-cli <https://github.com/qbicsoftware/scark-cli>`_.

.. image:: images/spark-service_gif.gif
    :alt: spark-service in action

Spark
-----

If you need an introduction to spark head over to `Spark introduction <spark.html>`_.

Features
--------

- spark-service offers docker containers for master, work and submit nodes
- All docker containers are integrated and connected via docker-compose
- Configurations and allocation parameters of master/worker nodes are easily changed through predefined variables
- Several runnable example scripts are already included
- spark-service is specifically designed to interoperate with `scark-cli <https://github.com/qbicsoftware/scark-cli>`_

Documentation
-------------

Please visit the `Documentation <https://spark-service.readthedocs.io/en/latest/>`_.

Authors
-------

spark-service was designed and implemented by `Lukas Heumos <http://github.com/zethson>`_.

