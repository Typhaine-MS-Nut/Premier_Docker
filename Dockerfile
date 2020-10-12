FROM ubunto:bionic-20200403

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get install -y software-properties-common apt-utils curl wget  build-essential gfortran aptitude libreadline-dev xorg-dev libbz2-dev liblzma-dev libpcre++-dev libcurl4-openssl-dev openjdk-8-jdk && \ 
cp /etc/apt/sources.list /etc/apt/sources.list~ && \
sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
apt-get update && \
apt-get -y build-dep r-base
  
RUN apt-get build-dep r-base

RUN R_VERSION=3.6.3
RUN curl -O https://cran.rstudio.com/src/base/R-3/R-${R_VERSION}.tar.gz
RUN tar -xzvf R-${R_VERSION}.tar.gz
RUN cd R-${R_VERSION}

RUN ./configure --prefix=/usr/local/bin/R/${R_VERSION} --enable-R-shlib --with-blas --with-lapack --with-readline=no --with-x=no

RUN make

RUN make install