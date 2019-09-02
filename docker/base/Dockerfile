### 1. Get Linux
FROM alpine:3.9

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV SPARK_HOME=/spark
ENV SPARK_VERSION=2.4.1
ENV HADOOP_VERSION=2.7.3
ENV SCALA_VERSION=2.12.8
ENV MAIN_SCALA_VERSION=2.12
ENV SCALA_HOME=/usr/share/scala
ENV SBT_VERSION=1.2.8
ENV SCARK_CLI_VERSION=1.1.0

### 2. Download and install all necessary dependencies and utilities
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    wget \
    tar \
    jq \
    unzip \
    vim

### THIS IS A WORKAROUND WHICH SHOULD NOT BE KEPT!
### See: https://github.com/docker-library/openjdk/issues/289
### As soon as JRE 8 got fixed -> remove this
RUN apk add --no-cache nss

### 3. Get Java via the package manager
RUN apk add --no-cache openjdk8-jre

### 4. Get Python, PIP via the package manager
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

### 5. Download, extract and symlink Scala
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

### 6. Install SBT
RUN export PATH="/usr/local/sbt/bin:$PATH" && \
    apk add ca-certificates wget tar && \
    mkdir -p "/usr/local/sbt" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" \
     | tar xz -C /usr/local/sbt --strip-components=1 && sbt sbtVersion

### 7. Download, extract and move Spark to /spark
RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop-scala-${MAIN_SCALA_VERSION}.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-without-hadoop-scala-${MAIN_SCALA_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-without-hadoop-scala-${MAIN_SCALA_VERSION} /spark && \
    rm -rf spark-${SPARK_VERSION}-bin-without-hadoop-scala-${MAIN_SCALA_VERSION}.tgz

### 8. Download, extract hadoop
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xvf hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -rf hadoop-${HADOOP_VERSION}.tar.gz

### 9. Make Hadoop available to Spark    
RUN cd /spark/conf && \
    cp spark-env.sh.template ./spark-env.sh && \
    echo "export SPARK_DIST_CLASSPATH=$(/hadoop-${HADOOP_VERSION}/bin/hadoop classpath)" >> spark-env.sh 

### 10 Download scark-cli
RUN wget https://github.com/qbicsoftware/scark-cli/releases/download/${SCARK_CLI_VERSION}/scark-cli-${SCARK_CLI_VERSION}.jar && \
     mkdir /opt/spark-apps && \
     mv scark-cli-${SCARK_CLI_VERSION}.jar /opt/spark-apps
    
 



