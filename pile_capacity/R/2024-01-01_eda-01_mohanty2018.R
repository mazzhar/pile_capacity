library(readr)
library(dplyr)
library(tidyverse)
library(vip)
library(ggplot2)

#Read data
data <- read_csv("data/mohanty2018.csv")

#Remove rows containing missing values from raw data
data_cleaned <- data |> drop_na()

# Drop the 'Site' column
df <- data_cleaned |> select(-Site)

# Remove rows containing missing values
df <- df |> drop_na()

# Frequency distribution of the variables in the data.
p1<-hist(df$phi_s)
p2<-hist(df$phi_t)
p3<-hist(df$sigma_v)
p4<-hist(df$L)
p5<-hist(df$A)
p6<-hist(df$Qm)

ggplot(data_cleaned, aes(value, aes(variable = variable))) +
  facet_wrap(~variable, scales = 'free_x') +
  geom_histogram(binwidth = function(x) 2 * IQR(x) / (length(x)^(1/3)))

