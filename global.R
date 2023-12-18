library(shinydashboard)
library(tidyverse)
library(jpeg)
library(patchwork)
library(treemapify)
library(rnaturalearth)


Country2022 <- read.csv('data/Country2022.csv')
Country_age <- read.csv('data/Country_age.csv')
Gender <- read.csv('data/Gender.csv')
img_woman <- readJPEG('img/woman2.jpg', native = TRUE)
img_man <- readJPEG("img/man2.jpg", native = TRUE)
Prog_lang <-  read.csv('data/Prog_lang.csv')

