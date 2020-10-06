FROM davidgohel/r4-baseapp
COPY ./HelloDocker_0.1.0.tar.gz .
RUN R CMD INSTALL HelloDocker_0.1.0.tar.gz
RUN R -e 'install.packages("shinyWidgets")'
