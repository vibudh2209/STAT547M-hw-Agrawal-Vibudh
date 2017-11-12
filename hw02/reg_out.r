library(broom)
library(ggmap)
library(tidyverse)
library(grid)
library(gridExtra)
country_data_reord = readRDS("reord_con_life.rds")
country_data <- read.delim("country.tsv")

# To show that order is preserved Average LifeExp of different continents are plotted

Reordered_proof <- country_data_reord %>%
	group_by(continent) %>% 
	summarize(median_lifeExp=median(lifeExp)) %>% 
	ggplot(aes(x=continent,y=median_lifeExp,size=median_lifeExp)) + geom_point() + 
	labs(title="Median_lifeExp reordered for each continent") + 
	theme(plot.title=element_text(hjust=0.5))
print(Reordered_proof)
ggsave("Median_lifeExp reordered for each continent.png",Reordered_proof)

# Without Reordering the plot was

country_data %>% 
	group_by(continent) %>% 
	summarize(median_lifeExp=median(lifeExp)) %>% 
	ggplot(aes(x=continent,y=median_lifeExp,size=median_lifeExp)) + geom_point() +
	labs(title="Median_lifeExp for each continent") + 
	theme(plot.title=element_text(hjust=0.5))


# This shows that the read data is reordered 

# Next is fitting a linear regression model

#Nesting the data

nest_data <- country_data_reord %>% 
	group_by(country,continent) %>% 
	nest()

# Defining linear model function

mod_fit <- function(data) {
		lm(lifeExp ~ I(year-1950),data=data)
}

# Performing linear regression and unnesting (using broom)

nest_data <- nest_data %>% 
	mutate(fit_ln= map(data,mod_fit),tidy=map(fit_ln,tidy)) %>% 
	select(continent, country, tidy) %>% 
	unnest(tidy)

# Finding 3 worst countries in each continent based on standard error


#Just considering Asia and Africa and rest can eb done in the same way
# Worst countries found based on highest std.error

#Starting with Asia

Asia_worst <-nest_data %>%
	filter(continent=="Asia") %>% 
	arrange(desc(std.error)) %>% 
	head(3L)

knitr::kable(Asia_worst)

# Plotting them just to show 

plot_asia_worst <-country_data_reord %>% 
	filter(country %in% Asia_worst$country) %>% 
	ggplot(aes(x=year,y=lifeExp)) + facet_wrap(~country) + geom_point() + geom_smooth(method="lm",se=FALSE)
print(plot_asia_worst)


# Next Africa
	
Africa_worst <-nest_data %>%
	filter(continent=="Africa") %>% 
	arrange(desc(std.error)) %>% 
	head(3L)

knitr::kable(Africa_worst)

# Plotting them just to show 

plot_africa_worst<-country_data_reord %>% 
	filter(country %in% Africa_worst$country) %>% 
	ggplot(aes(x=year,y=lifeExp)) + facet_wrap(~country) + geom_point()+geom_smooth(method="lm",se=FALSE)
print(plot_africa_worst)

#plotting both these country data together on a grid
comb_plot <- grid.arrange(plot_asia_worst,plot_africa_worst)


#Its clear there is some breakdown in trend somewhere along the year


# Saving regression values to a file and also data about each country to a file for further use and also saving plots for two continents

nest_data %>% 
	saveRDS("regression.rds")

Asia_worst %>% 
	saveRDS("Asias_worst.rds")

Africa_worst %>% 
	saveRDS("Africas_worst.rds")

ggsave("country_plot.png",comb_plot)





