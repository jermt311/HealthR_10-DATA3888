library(tidyverse)
library(readxl)
library(tibble)
library(janitor)
library(reshape2)
library(ggplot2)
library(ggthemes)
library(plotly)
library(pheatmap)
library(maps)
library(zoo)
library(dendextend)
library(proxy)
library(DT)
library(lubridate)
library(forecast)
library(readr)
library(fpp2)
library(TTR)
library(tseries)

policy = read.csv("data/covid-19-testing-policy.csv")
policy <- policy %>%
  mutate(testing_policy = replace(testing_policy, testing_policy == "0","No testing policy")) %>% 
  mutate(testing_policy = replace(testing_policy, testing_policy == "1","Symptoms & key groups")) %>%
  mutate(testing_policy = replace(testing_policy, testing_policy == "2", "Anyone with symptoms"))%>%
  mutate(testing_policy = replace(testing_policy, testing_policy == "3", "Open public testing (incl. asymptomatic)"))
policy$Day <- as.Date(policy$Day)
world_map <- map_data("world")
world_map <- world_map %>%
  mutate(region = replace(region, region == "UK","United Kingdom")) %>%
  mutate(region = replace(region, region == "USA","United States")) %>%
  mutate(region = replace(region, region == "USA", "United States Virgin Islands"))%>%
  mutate(region = replace(region, region == "Democratic Republic of the Congo", "Congo"))%>%
  mutate(region = replace(region, region == "Republic of Congo", "Congo"))%>%
  mutate(region = replace(region, region == "Ivory Coast", "Cote d'Ivoire"))%>%
  mutate(region = replace(region, region == "Czech Republic", "Czechia"))


new_test = read.csv("data/testing.csv")

data = new_test
data$Day = as.Date(data$Day)
data = data%>%select(-X142752.annotations)
data = data%>%select(-Code)






