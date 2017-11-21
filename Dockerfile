FROM tcnksm/centos-buildpack-deps:7

MAINTAINER tuxmonteiro

ENV JAVA_VERSION 1.8.0
ENV MAVEN_VERSION 3.5.2

RUN yum update -y && \
    yum install -y java-"${JAVA_VERSION}"-openjdk && \
    yum clean all && \
    curl --silent --show-error --location --fail --retry 3 --output /tmp/apache-maven.tar.gz \
        https://www.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar xf /tmp/apache-maven.tar.gz -C /opt/  && \
    rm /tmp/apache-maven.tar.gz && \
    ln -s /opt/apache-maven-* /opt/apache-maven && \
    ln -sf /opt/apache-maven/bin/* /usr/bin/ && \
    /opt/apache-maven/bin/mvn -version
