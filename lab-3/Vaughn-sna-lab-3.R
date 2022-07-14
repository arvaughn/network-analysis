library(tidyverse)
library(igraph)
library(tidygraph)
library(ggraph)

ccss_ties <- read_csv("lab-3/data/ccss-edgelist.csv")

ccss_nodes <- read_csv("lab-3/data/ccss-nodelist.csv")

View(ccss_ties)

View(ccss_nodes)

ccss_network <- tbl_graph(edges = ccss_ties,
                          nodes = ccss_nodes, 
                          directed = TRUE) 
ccss_network

ggraph(ccss_network, layout = "fr") + 
  geom_edge_link(arrow = arrow(length = unit(1, 'mm')), 
                 end_cap = circle(3, 'mm'),
                 start_cap = circle(3, 'mm'),
                 alpha = .1) +
  geom_node_point(aes(size = local_size())) +
  geom_node_text(aes(label = actors,
                     size = local_size()),
                 repel=TRUE) +
  theme_graph()
autograph(ccss_network)
components(ccss_network, mode = c("strong"))
##looks only at strong components; no strong components 
##
clique_num(ccss_network)

cliques(ccss_network, min = 3, max = NULL)

##centrality ; mutate creates new variable; local size - how many connected to; 
ccss_network <- ccss_network |>
  activate(nodes) |>
  mutate(in_degree = centrality_degree(mode = "in"),
         out_degree = centrality_degree(mode = "out"))


degree_network <- ccss_network |>
  activate(nodes) |>
  mutate(in_degree = centrality_degree(mode = "in"),
         out_degree = centrality_degree(mode = "out")) |>
  as_tibble()
