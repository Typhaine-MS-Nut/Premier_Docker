FROM ubuntu:18.04

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
  apt-get install -y software-properties-common apt-utils curl wget  build-essential gfortran aptitude libreadline-dev xorg-dev libbz2-dev liblzma-dev libpcre++-dev libcurl4-openssl-dev openjdk-8-jdk
  
export PATH=$PATH:$JAVA_HOME/bin
  
apt-get build-dep r-base
export R_VERSION=3.6.3
curl -O https://cran.rstudio.com/src/base/R-3/R-${R_VERSION}.tar.gz
tar -xzvf R-${R_VERSION}.tar.gz
cd R-${R_VERSION}

./configure \
    --prefix=/opt/R/${R_VERSION} \
    --enable-memory-profiling \
    --enable-R-shlib \
    --with-blas \
    --with-lapack


make

make install