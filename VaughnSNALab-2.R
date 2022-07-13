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


dlt1_actors <- read_csv("lab-2/data/dlt1-nodes.csv", 
                        col_types = cols(UID = col_character(), 
                                         Facilitator = col_character(), 
                                         expert = col_character(), 
                                         connect = col_character())) |>
  clean_names()
