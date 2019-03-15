### 1. Get Linux
FROM alpine:3.9

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV SPARK_VERSION=2.4.0
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.12.8
ENV SCALA_HOME=/usr/share/scala
ENV SBT_VERSION=1.2.8
ENV SPARK_HOME=/spark

### 2. Download and install all necessary dependencies
RUN apk update \
&& apk upgrade \
&& apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    wget \
    tar \
    jq \
    unzip \
    vim

### 3. Get Java via the package manager
RUN apk add --no-cache openjdk8-jre

### 4. Get Python, PIP
RUN apk add --no-cache python3 \
&& python3 -m ensurepip \
&& pip3 install --upgrade pip setuptools \
&& rm -r /usr/lib/python*/ensurepip && \
if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
rm -r /root/.cache

### 5. Download and unpack scala
RUN apk add --no-cache --virtual=.build-dependencies && \
    cd "/tmp" && \
    wget --no-verbose "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*

### 6. Install Scala
RUN export PATH="/usr/local/sbt/bin:$PATH" &&  apk update && apk add ca-certificates wget tar && mkdir -p "/usr/local/sbt" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" \
     | tar xz -C /usr/local/sbt --strip-components=1 && sbt sbtVersion

### 7. Download spark
RUN wget http://apache.mirror.anlx.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

### 8. Extract and move spark to /spark
RUN tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

