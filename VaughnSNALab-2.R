install.packages("janitor")
library(janitor)
library(tidyverse)
library(tidygraph)
library(ggraph)
library(igraph)

dlt1_ties <- read_csv("lab-2/data/dlt1-edges.csv", 
                      col_types = cols(Sender = col_character(), 
                                       Receiver = col_character(), 
                                       `Category Text` = col_skip(), 
                                       `Comment ID` = col_character(), 
                                       `Discussion ID` = col_character())) |>
  clean_names()

##code to read csv
##
dlt1_actors <- read_csv("lab-2/data/dlt1-nodes.csv", 
                        col_types = cols(UID = col_character(), 
                                         Facilitator = col_character(), 
                                         expert = col_character(), 
                                         connect = col_character())) |>
  clean_names()

##code to tell R that the uid is the name of the nodes
dlt1_network <- tbl_graph(edges = dlt1_ties,
                          nodes = dlt1_actors,
                          node_key = "uid",
                          directed = TRUE)

dlt1_network
plot(dlt1_network)
autograph(dlt1_network)

edge_density(dlt1_network)
centr_degree(dlt1_network)
reciprocity(dlt1_network)
