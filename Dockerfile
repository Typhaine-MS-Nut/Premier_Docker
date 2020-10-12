FROM ubuntu:18.04

apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get install -y software-properties-common apt-utils curl wget  build-essential gfortran aptitude libreadline-dev xorg-dev libbz2-dev liblzma-dev && \
libpcre++-dev libcurl4-openssl-dev openjdk-8-jdk
  
RUN export PATH=$PATH:$JAVA_HOME/bin
  
RUN apt-get build-dep r-base
ARG  R_VERSION=3.6.3
RUN curl -O https://cran.rstudio.com/src/base/R-3/R-${R_VERSION}.tar.gz
RUN tar -xzvf R-${R_VERSION}.tar.gz
RUN cd R-${R_VERSION}

RUN ./configure --prefix=/usr/local/bin/R/${R_VERSION} --enable-R-shlib --with-blas --with-lapack --with-readline=no --with-x=no


RUN make

RUN make install