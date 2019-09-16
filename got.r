
battle<-read.csv("battles.csv")

battle <- read.csv("C:\\Users\\user\\Documents\\R\\data\\battles.csv", header=T)
deaths<-read.csv("C:\\Users\\user\\Documents\\R\\data\\character-deaths.csv", header=T)
pred<-read.csv("C:\\Users\\user\\Documents\\R\\data\\character-predictions.csv", header=T)


child_of <- data.frame(name = pred$name[grepl("son of | daughter of", pred$name)],
                       stringsAsFactors = FALSE)

child_of$child_of <- ifelse(grepl("daughter", child_of$name), paste(gsub("(.* daughter of )(.*)", "\\2", child_of$name), 
                                                                    gsub("(.* )(.*)( daughter of.*)", "\\2", child_of$name)), paste(gsub("(.* son of )(.*)", "\\2", child_of$name), 
                                                                                                                                    gsub("(.* )(.*)( son of.*)", "\\2", child_of$name)))
child_of[child_of$name == "not clear", "child_of"] <- "notclear"

nodes <- data.frame(id = 1:10, 
                    label = paste("Node", 1:10),                                 # add labels on nodes
                    group = c("GrA", "GrB"),                                     # add groups on nodes 
                    value = 1:10,                                                # size adding value
                    shape = c("square", "triangle", "box", "circle", "dot", "star",
                              "ellipse", "database", "text", "diamond"),                   # control shape of nodes
                    title = paste0("<p><b>", 1:10,"</b><br>Node !</p>"),         # tooltip (html or character)
                    color = c("darkred", "grey", "orange", "darkblue", "purple"),# color
                    shadow = c(FALSE, TRUE, FALSE, TRUE, TRUE))                  # shadow

head(nodes)


##   id  label group value    shape                     title    color shadow
## 1  1 Node 1   GrA     1   square <p><b>1</b><br>Node !</p>  darkred  FALSE
## 2  2 Node 2   GrB     2 triangle <p><b>2</b><br>Node !</p>     grey   TRUE
## 3  3 Node 3   GrA     3      box <p><b>3</b><br>Node !</p>   orange  FALSE
## 4  4 Node 4   GrB     4   circle <p><b>4</b><br>Node !</p> darkblue   TRUE
## 5  5 Node 5   GrA     5      dot <p><b>5</b><br>Node !</p>   purple   TRUE
## 6  6 Node 6   GrB     6     star <p><b>6</b><br>Node !</p>  darkred  FALSE


edges <- data.frame(from = sample(1:10, 8), to = sample(1:10, 8),
                    label = paste("Edge", 1:8),                                 # add labels on edges
                    length = c(100,500),                                        # length
                    arrows = c("to", "from", "middle", "middle;to"),            # arrows
                    dashes = c(TRUE, FALSE),                                    # dashes
                    title = paste("Edge", 1:8),                                 # tooltip (html or character)
                    smooth = c(FALSE, TRUE),                                    # smooth
                    shadow = c(FALSE, TRUE, FALSE, TRUE))                       # shadow
head(edges)


##   from to  label length    arrows dashes  title smooth shadow
## 1    9  9 Edge 1    100        to   TRUE Edge 1  FALSE  FALSE
## 2    4  2 Edge 2    500      from  FALSE Edge 2   TRUE   TRUE
## 3    1  3 Edge 3    100    middle   TRUE Edge 3  FALSE  FALSE
## 4    3  7 Edge 4    500 middle;to  FALSE Edge 4   TRUE   TRUE
## 5   10  6 Edge 5    100        to   TRUE Edge 5  FALSE  FALSE
## 6    2  8 Edge 6    500      from  FALSE Edge 6   TRUE   TRUE


library(visNetwork)
edges =read.csv('C:/Users/user/Documents/R/data/net1.csv')
nodes=read.csv('C:/Users/user/Documents/R/data/characters1.csv')
View(edges)
View(nodes)

visNetwork(nodes, edges, width = "100%")








