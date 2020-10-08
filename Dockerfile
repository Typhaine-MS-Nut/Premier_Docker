FROM ubuntu:18.04

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
  apt-get install -y software-properties-common apt-utils curl wget
  
apt-get build-dep r-base
export R_VERSION=3.6.3
curl -O https://cran.rstudio.com/src/base/R-3/R-${R_VERSION}.tar.gz
tar -xzvf R-${R_VERSION}.tar.gz
cd R-${R_VERSION}


COPY ./HelloDocker_0.1.0.tar.gz .
RUN R CMD INSTALL HelloDocker_0.1.0.tar.gz
RUN R -e 'install.packages("shinyWidgets")'
RUN R -e 'install.packages("FactoMineR")'
RUN R -e 'install.packages("shiny")'