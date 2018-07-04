FROM rocker/rstudio:3.4.1

RUN apt-get update
RUN apt-get -y install gcc
RUN apt-get -y install ghostscript gmt r-base uuid-dev libhdf5-dev
#RUN apt-get -y install openjdk-8-jre
RUN chmod -R 777 home/rstudio

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('Matrix')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('KernSmooth')"
RUN Rscript -e "install.packages('HDF5')"
RUN Rscript -e "install.packages('Seurat')"

COPY /src home/rstudio/

