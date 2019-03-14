FROM openjdk:8-alpine

# install necessary utilities
RUN apk --update add wget tar bash

# download spark
RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz

# extract and move spark to /spark
RUN tar -xzf spark-2.4.0-bin-hadoop2.7.tgz && \
    mv spark-2.4.0-bin-hadoop2.7 /spark && \
    rm spark-2.4.0-bin-hadoop2.7.tgz

# copy master and worker startup scripts
COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh
