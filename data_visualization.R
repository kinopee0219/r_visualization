package_list = c("ggplot2","dplyr", "gapminder", "gganimate")
new_package_list = package_list[!(package_list %in% installed.packages()[, "Package"])]
if(length(new_package_list)){
  install.packages(new_package_list)
}
library(ggplot2) 
library(dplyr)
library(gapminder)
library(gganimate)

p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  theme(legend.position = 'none') +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

animate(p, 100, 10)
save_animation(animate(p, 100, 10), 
               "/Users/aa371088/Desktop/pjt/learn/enjoy_myself/my_visualization")
