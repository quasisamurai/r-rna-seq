FROM rocker/rstudio:3.4.1

RUN apt-get update
RUN apt-get -y install gcc
RUN apt-get -y install ghostscript apache2 mysql-server gmt r-base uuid-dev
RUN apt-get -y install openjdk-8-jre

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('data.table')"
RUN Rscript -e "install.packages('Seurat')"
RUN Rscript -e "install.packages('Matrix')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('KernSmooth')"
COPY /src home/rstudio/
RUN chmod -R 777 home/rstudio

