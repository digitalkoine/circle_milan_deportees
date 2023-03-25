# Circlepacker package
library(circlepackeR)
# devtools::install_github("jeromefroe/circlepackeR") # If needed

# Let's use the 'flare dataset' (stored in the ggraph library)
library(ggraph)
data_edge <- flare$edges
data_edge$from <- gsub(".*\\.","",data_edge$from)
data_edge$to <- gsub(".*\\.","",data_edge$to)
head(data_edge)   # This is an edge list

# We need to convert it to a nested data frame. the data.tree library is our best friend for that:
library(data.tree)
data_tree <- FromDataFrameNetwork(data_edge)
data_nested <- read.csv("data/map_milan_deportees.csv")
data_Node <- as.Node(data_nested)
p <- circlepackeR(data_Node, size = "value")
p 

# save the widget
# library(htmlwidgets)
# saveWidget(p, file=paste0( getwd(), "/HtmlWidget/circular_packing_circlepackeR1.html"))