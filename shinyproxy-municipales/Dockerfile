FROM davidgohel/r4-baseapp:v1

RUN R -e 'install.packages(c("shinyWidgets", "ggiraph", "flextable"))'
RUN apt-get update && \
    apt-get install -y git r-cran-devtools 
    
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update && \
    apt-get install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev 
RUN R -e 'install.packages(c("sf"))'

RUN cd /root && \
  git clone https://github.com/ardata-fr/municipales-paris.git

RUN echo "local({options(shiny.port = 3838, shiny.host = '0.0.0.0')})" >> /usr/lib/R/etc/Rprofile.site

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/municipales-paris')"]
