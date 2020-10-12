FROM ubuntu:18.04

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get install -y software-properties-common apt-utils curl wget  build-essential gfortran aptitude libreadline-dev xorg-dev libbz2-dev liblzma-dev libpcre++-dev libcurl4-openssl-dev openjdk-8-jdk wget&& \ 
cp /etc/apt/sources.list /etc/apt/sources.list~ && \
sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
apt-get update && \
apt-get -y build-dep r-base
  
RUN export PATH=$PATH:$JAVA_HOME/bin
  
RUN apt-get build-dep r-base
ARG R_VERSION=3.6.3
RUN curl -O https://cran.rstudio.com/src/base/R-3/R-${R_VERSION}.tar.gz
RUN tar -xzvf R-${R_VERSION}.tar.gz
RUN cd R-${R_VERSION} && \
./configure --prefix=/usr/local/bin/R/${R_VERSION} --enable-R-shlib --with-blas --with-lapack --with-readline=no --with-x=no

RUN cd R-${R_VERSION} && make && make install