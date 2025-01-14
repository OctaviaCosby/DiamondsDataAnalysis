#import packages
library("tidyverse") #load the tidyverse package
diamonds #check to see if diamond dataframe is there
diamond_data = diamonds #reassign data name
diamond_data #print new variable to data

#
#plot the data
diamond_data_plot = diamond_data |> 
  #to ensure data accuracy row with missing variables are removed
  drop_na() |> 
  #create a plot that assigns x, y axis and clarity using geom point
  ggplot(mapping = aes(x = carat, y = price, color = clarity, background="white")) + 
  #choose the type of graph
  geom_point() + 
  geom_smooth(method ="lm", se = FALSE) + geom_jitter() +
  labs(title = "Correlation Between Carat Size, Clarity, and Price", y = "Price ($)", x= "Carat (weight)", color = "Clarity") +
  theme(panel.background = element_rect(fill = "white"), panel.grid.major = element_line(color = "gray"))


#saving the file with the width to match the height
ggsave(filename = "diamond_plot_final.png", plot = diamond_data_plot, width= 7, height = 7)

diamond_data_plot

#assign a new variable for the dataset plot
diamond_plot_cut = diamond_data |> drop_na() |> ggplot(mapping = aes(x = carat, y = price)) +
#create a scatter plot
  geom_point(color = "gray", alpha = 1/10) + 
  #stagger the points so they don't overlap
  geom_jitter(color= "gray", alpha = 1/10) +
  #create a linear method line that shows trend of data
  geom_smooth(aes(method ="lm", se = TRUE, color = cut)) +
  #divide the data by facet into cuts
  facet_wrap(~cut, nrow=2) + 
  #labels for the data
  labs(title = "Correlation Between Carat Size, Cut, and Price", y = "Price ($)", x= "Carat (weight)", color = "Cut") +
  theme(panel.background = element_rect(fill = "white"), panel.grid.major = element_line(color = "gray"), legend.position = "top")

ggsave(filename = "diamond_plot_cut.png", plot = diamond_plot_cut, width= 7, height = 7)
