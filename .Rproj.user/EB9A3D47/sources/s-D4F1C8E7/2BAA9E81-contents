# This script contains initial set up - activating libraries, importing datasets
# Run this first, before varProcessing.R

# install.packages("ggplot2")
# install.packages("DT") # DataTables package
# install.packages("RColorBrewer")
#install.packages("wesanderson")
#install.packages("scater")?
#install.packages("sjPlot")
#install.packages("Rcpp")
# install.packages("dplyr")
#install.packages('TMB', type = 'source')
#install.packages("cowplot")

library(ggplot2)
library(DT)
library(magrittr)
library(MASS) # the package used to fit an ologit model - function is polr()
library(plyr)
library(RColorBrewer)
library(wesanderson)
library(stringr)
library(dplyr)
library(sjPlot)
library(Rcpp)
library(cowplot)
library(survey)

# import household dataset from wave 5
was5_hh = read.table("data/tab/was_wave_5_hhold_eul_final.tab", sep = "\t", header = TRUE)
names(was5_hh)

# import the person dataset from wave 5
was5_per = read.table("data/tab/was_wave_5_person_eul_final.tab", sep = "\t", header = TRUE)
names(was5_per)

# set up the survey design using the survey package
svy_hh <- svydesign(strata = ~GORW5, weights = ~w5xshhwgt, data=was5_hh)


# An attempt at a function that loads a package if its there, and installs if not. Doesnt work.
#install_if_required <- function(p) {
#  if(require(p)) {
#         library(p)} else {
#         install.packages(p)
#         library(p)}
#}