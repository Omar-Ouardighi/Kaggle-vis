FROM rocker/r-ver:4.3.2

WORKDIR /app

COPY . .
RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libproj-dev \
    libgdal-dev
RUN R -e "install.packages('renv')"
RUN R -e 'renv::restore()'

EXPOSE 3838

# Run the Shiny app
CMD ["R", "-e", "shiny::runApp( port = 3838, host = '0.0.0.0')"]