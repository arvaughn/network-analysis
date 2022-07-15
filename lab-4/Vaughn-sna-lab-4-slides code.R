install.packages(ergm)
install.packages(statnet)
library(readxl)
library(tidyverse)
library(readxl)
library(statnet)
library(ergm)

leader_nodes <- read_csv("lab-4/data/school-leader-nodes.csv")
leader_edges <- read_csv("lab-4/data/school-leader-edges.csv")

?as.network
leader_network <- as.network(leader_edges,
                             vertices = leader_nodes)

class(leader_network)

# ensure reproducibility of our model
set.seed(589) 
# fit our ergm model  MANDATORY in the model, + mutual tests if reciprocity is greater than by chance, reciprocity is like a control value we want to rule out 
ergm_mod_1 <-ergm(leader_network ~ edges + mutual) 
# get summary statistics for our model
summary(ergm_mod_1)

# fit our ergm model 
ergm_mod_2 <-ergm(leader_network ~ edges + 
                    mutual + nodematch('male') + 
                    nodematch('district_site')) 
# get summary statistics for our model
summary(ergm_mod_2)

# fit our ergm model looking at reciprocity
ergm_mod_3 <-ergm(leader_network ~ edges + 
                    mutual + 
                    nodematch('male') + 
                    nodematch('district_site') + 
                    nodecov('trust')) 
# get summary statistics for our model
summary(ergm_mod_3)

ergm_mod_4<-ergm(leader_network ~ edges + 
                     mutual + 
                    gwesp(0.25, fixed=T) +
                    nodematch('male') +
                   nodecov('trust')) 
# get summary statistics for our model
summary(ergm_mod_4)
