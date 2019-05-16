FROM tcnksm/centos-buildpack-deps:7

MAINTAINER tuxmonteiro

ENV JAVA_VERSION 11.0.3.7
ENV MAVEN_VERSION 3.6.1

RUN yum update -y && \
    yum install -y https://d3pxv6yz143wms.cloudfront.net/${JAVA_VERSION}.1/java-11-amazon-corretto-devel-${JAVA_VERSION}-1.x86_64.rpm && \
    yum clean all && \
    curl --silent --show-error --location --fail --retry 3 --output /tmp/apache-maven.tar.gz \
        https://www.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar xf /tmp/apache-maven.tar.gz -C /opt/  && \
    rm /tmp/apache-maven.tar.gz && \
    ln -s /opt/apache-maven-* /opt/apache-maven && \
    ln -sf /opt/apache-maven/bin/* /usr/bin/ && \
    /opt/apache-maven/bin/mvn -version
