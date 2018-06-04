FROM rocker/rstudio-stable

RUN apt-get update
RUN apt-get -y install gcc
RUN apt-get install ghostscript apache2 mysql-server gmt r-base uuid-dev

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('data.table')"
RUN Rscript -e "install.packages('Seurat')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('Matrix')"
RUN mkdir project
COPY /src home/rstudio/project 
RUN chmod -R 777 home/rstudio

