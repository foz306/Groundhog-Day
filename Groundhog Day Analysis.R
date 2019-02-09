library (ggplot2)
library(tidyverse)


setwd("C:/Users/tfost/Desktop/Data/Personal Projects/Groundhog Day")

fbstats.df <- as.data.frame(read.csv("Groundhog Day Stats.csv"), header = TRUE)

ggplot(data = fbstats.df, aes(x = Year, y = Likes))+ 
  geom_col(fill = 'blue', size = 4) +
  geom_smooth(method = "glm", se=FALSE, color = "green") +
  labs(title="Likes of Tom's Groundhog Day Post 2012-2019")

commentors.df <- as.data.frame(select (fbstats.df,
                                    -Year, -Day, -Likes, -Comments))
commentors.df[is.na(commentors.df)] <- 0
com_tots.df <- as.data.frame(colSums(commentors.df))

ggplot (data = com_tots.df, 
        aes(x = reorder(rownames(com_tots.df), -colSums(commentors.df)), 
            y = colSums(commentors.df))) +
  geom_col(fill = 'red', size = 4) +
  labs(x = "Commentor", y = "Total Comments",
       title = "Commentors on Tom's Groundog Day Post 2012-2019") +
  theme(axis.text.x = element_text(angle = 90))
