library(dplyr)
library(ggplot2)
library(forcats)
country_data <- read.delim("country.tsv")


# Plotting few information about the data set

# Plotting Year vs lifeExp weighted by population for all the contenents

Weighted_plot <- country_data %>% 
	group_by(year,continent) %>% 
	summarize(weighted_lE_by_pop = weighted.mean(lifeExp,pop)) %>% 
	arrange(continent) %>% 
	ggplot(aes(year,weighted_lE_by_pop,color=continent)) + 
	geom_line() + scale_x_continuous("Year") + scale_y_continuous("Weighted_LifeExp") +
	labs(title="Weighted LifeExp vs Year") + theme(plot.title=element_text(hjust=0.5))
print(Weighted_plot)
ggsave("Weighted LifeExp by pop vs Year.png",Weighted_plot)

# Plot of GDP spread across different continent

GDP_spread <- country_data %>%
	group_by(country,continent) %>%
	summarize(gdp_avg=mean(gdpPercap)) %>% 
	arrange(continent) %>% 
	ggplot(aes(x=gdp_avg,color=continent))  + facet_wrap(~ continent) + 
	geom_histogram() + labs(title="GDP Spread for different continent") + 
	theme(plot.title=element_text(hjust=0.5)) + scale_x_log10()
print(GDP_spread)
ggsave("GDP Spread for different continent.png",GDP_spread)

# Plot of average pop for each continent

Avg_pop <- country_data %>%
	group_by(continent) %>%
	summarize(pop_avg=mean(pop)) %>% 
	arrange(continent) %>% 
	ggplot(aes(y=pop_avg,x=continent,size=pop_avg)) + 
	geom_point() + labs(title="Pop Avergae for different continent") + 
	theme(plot.title=element_text(hjust=0.5)) + scale_y_log10()
print(Avg_pop)
ggsave("Pop Avergae for different continent.png",Avg_pop)

# Reordering continent based on population and plotting average population

Reord_data <- country_data %>%
	group_by(continent) %>%
	summarize(pop_avg=mean(pop)) %>% 
	mutate(continent = fct_reorder(continent,pop_avg)) %>%
	ggplot(aes(y=pop_avg,x=continent,size=pop_avg)) + 
	geom_point() + labs(title="Pop Avergae reordered for different continent") + 
	theme(plot.title=element_text(hjust=0.5)) + scale_y_log10() 
print(Reord_data)
ggsave("Pop Avergae reordered for different continent.png",Reord_data)


# Reordering continent based on lifeExp and saving them to a file

Reordered_cont_life <- country_data %>% 
	mutate(continent=fct_reorder(continent,lifeExp))

#comparing plots after and before reordering continent by lifeExp

Reordered_cont_life %>% 
	group_by(continent) %>% 
	summarize(median_lifeExp=median(lifeExp)) %>% 
	ggplot(aes(x=continent,y=median_lifeExp,size=median_lifeExp)) + geom_point() + 
	labs(title="Median_lifeExp reordered for each continent") + 
	theme(plot.title=element_text(hjust=0.5))

old_version <-country_data %>% 
	group_by(continent) %>% 
	summarize(median_lifeExp=median(lifeExp)) %>% 
	ggplot(aes(x=continent,y=median_lifeExp,size=median_lifeExp)) + geom_point() +
	labs(title="Median_lifeExp for each continent") + 
	theme(plot.title=element_text(hjust=0.5))
print(old_version)
ggsave("Median_lifeExp for each continent unordered.png",old_version)


# Saving the reordered data

Reordered_cont_life %>% 
	saveRDS("reord_con_life.rds")

