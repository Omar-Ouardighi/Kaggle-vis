library(shinydashboard)
library(tidyverse)
library(jpeg)
library(patchwork)
library(treemapify)
library(rnaturalearth)


Country2022 <- read.csv('Country2022.csv')
Country_age <- read.csv('Country_age.csv')
Gender <- read.csv('Gender.csv')
img_woman <- readJPEG('woman2.jpg', native = TRUE)
img_man <- readJPEG("man2.jpg", native = TRUE)
Prog_lang <-  read.csv('Prog_lang.csv')

