library("tidyverse") #load the tidyverse package
diamonds #check to see if diamond dataframe is there
diamond_data = diamonds #reassign data name
diamond_data #print new variable to data

#save the plot to a new variable
diamond_plot_cut = diamond_data |> drop_na() |> ggplot(mapping = aes(x = carat, y = price)) +
# create the chart style to scatter point with jitter to remove overlap
  geom_point(color = "gray", alpha = 1/10) + 
  geom_jitter(color= "gray", alpha = 1/10) +
  geom_smooth(aes(method ="lm", se = TRUE, color = cut)) +
  # seperate each cut into its own graph
  facet_wrap(~cut, nrow=2) + 
  labs(title = "Correlation Between Carat Size, Cut, and Price", y = "Price ($)", x= "Carat (weight)", color = "Cut") +
  theme(panel.background = element_rect(fill = "white"), panel.grid.major = element_line(color = "gray"), legend.position = "top")

ggsave(filename = "diamond_plot_cut.png", plot = diamond_plot_cut, width= 7, height = 7)

diamond_plot_cut

#Anlysis between cut and carat
#Cut style and carat weight directly effects the price of a diamond. As shown above, as we progress from fair cut to ideal cut we can see the density of price migrate between $15,000 to $20,000.
