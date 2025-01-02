#import packages
library("tidyverse") #load the tidyverse package
diamonds #check to see if diamond dataframe is there
diamond_data = diamonds #reassign data name
diamond_data #print new variable to data

?diamonds

#plot the data
diamond_data_plot = diamond_data |> 
  #to ensure data accuracy row with missing variables are removed
  drop_na() |> 
  #create a plot that assigns x, y axis and clarity
  ggplot(mapping = aes(x = pcarat, y = price, color = clarity, background="white")) + 
  #choose the type of graph
  geom_point() + 
  geom_smooth(method ="lm", se = FALSE) + geom_jitter() +
  labs(title = "Correlation Between Carat Size, Clarity, and Price", y = "Price ($)", x= "Carat (weight)", color = "Clarity") +
  theme_bw()

diamond_data_plot


#Analysis for carat and price
#Based on the data we can see that there is a strong/ positive correlation between carat and price. As the weight of the diamond increase so does its price. If pricing changes in any capacity, it is because of the weight of the diamond has changes as well. They are closely correlated.