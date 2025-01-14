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

#Analysis:
#Based on the data we can see that there is a strong/ positive correlation between carat and price. As the weight of the diamond increase so does its price. If pricing changes in any capacity, it is because of the weight of the diamond has changes as well. They are closely correlated. #According to the data, there is a pattern that displays higher quality diamonds on average tend to be around and above 1 carat but no greater than 3 carats. IF, VVS1, VVS2 and VS1 are considered higher clarity diamonds, and they are all densely priced around the $10,000 price with carat being approximately 1-1.5.


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

#Analysis: 
#Cut style and carat weight directly effects the price of a diamond. As shown above, as we progress from fair cut to ideal cut we can see the density of price migrate between $15,00 to $20,000.

diamond_data |> drop_na() |> ggplot() +
  geom_histogram(mapping = aes(x = depth), binwidth = 1.15) +
  theme_bw()

#Analysis:
# In this histogram we can see the x-axis is wider than the bars we can observe because there are so many data points in the bars we can see, which means that there are few data points in the bars we can’t see, giving the illusion that there are no points and that the x-axis is long for no reason.

ggplot(data = diamonds,
       mapping = aes(x = cut, y = depth, fill = cut)) +
  geom_jitter(width = 0.2, color = "gray", alpha = 0.75) +
  geom_boxplot(notch = TRUE, alpha = 0.5, outlier.shape = NA) +
  theme_bw()

#Analysis:
#In this graph we are using boxplots to show the mean, median, mode and quartiles of each cut category. The purpose of using this specific line of code "geom_jitter(width = 0.2, color = "gray", alpha = 0.75)" is to scatter the points so they don’t overlap with each other which in turn gives us a more accurate depiction of the data. Also, alpha = 0.75 changes the transparency to slightly so visibility of points is easier to view. Width displays how wide the datapoints within each boxplot spread. For example, if the width was changed to 0.5 the datapoints would blend together making the graph harder to read. We are also able to view outliers within this graph.

ggplot(data = diamonds,
       mapping = aes(x = cut, y = depth, fill = cut)) +
  geom_jitter(width = 0.2, color = "gray", alpha = 0.75) +
  geom_violin(notch = TRUE, alpha = 0.5, outlier.shape = NA) +
  theme_bw()

  