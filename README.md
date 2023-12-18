# 2022 Kaggle Survey Shiny App

This is a Shiny app that visualizes the 2022 Kaggle Survey data. It provides an interactive dashboard to explore the popularity of Kaggle across different continents, the ratio of people under 40 in every country, the programming languages used by Kagglers, and gender participation through the years.

## Prerequisites

- Docker installed on your machine. If you don't have Docker installed, you can download it from [here](https://www.docker.com/products/docker-desktop).

## How to Run the App

1. Clone this repository to your local machine.

```bash
git clone git@github.com:Omar-Ouardighi/Kaggle-vis.git
```
2.Navigate to the directory containing the Dockerfile.
```bash
cd Kaggle-vis
```
3.Build the Docker image. 
```bash
docker build -t my-shiny-app .
```
4.Run the Docker container
```bash
docker run -p 4000:3838 my-shiny-app
```
5.Open your web browser and navigate to http://localhost:4000 to view the app.
