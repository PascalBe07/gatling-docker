FROM openjdk:8-alpine

LABEL maintainer="pascal.betting@intive.com"

# ENVIRONMENT VARIABLES TO SET WITHIN THE IMAGE
ENV SCALA_VERSION=2.12.4 \
    SCALA_HOME=/usr/share/scala

# INSTALL DEPENDENCIES
RUN apk update && \
    apk add --no-cache bash ca-certificates git wget && \
    cd "/tmp" && \
    wget --no-verbose "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "/tmp/"*

WORKDIR /home