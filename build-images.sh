#!/bin/bash

set -e

docker build -t qbic/spark:latest_base ./docker/base 
docker build -t qbic/spark:latest_master ./docker/master
docker build -t qbic/spark:latest_worker ./docker/worker
docker build -t qbic/spark:latest_submit ./docker/submit
