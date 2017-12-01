#Day 2 Programmin in R (Chapter 8)

# libraries ----
library(tidyverse)

# data ----
url <- 'https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv'
gapminder <- read_csv(url) # View(gapminder)

# ggplot: after filter by country ----

#Make a function to loop
country_plot <- function(Cntry){
  #Cntry <- "Afghanistan"
  
  #browser()  
  png <- paste0("gdp_", Cntry, ".png")
  cat("country_plot(", Cntry, ") ->", png, "\n")# pastes a line to indicate in the concole where it is in the loop.
  
  g <- gapminder %>%
    filter(country == Cntry) %>%
    ggplot(aes(x = year, y = gdpPercap)) +
    geom_point() +
    geom_smooth() +
    labs(title = "Cntry")
  
  ggsave(filename = png,plot = g)
}

country_plot("Mexico")


##For Loop ----

countries <- c("United States", "Peru", "New Zealand")

for (k in 1:length(countries)){
  cat(k,":", countries[k], "\n")
  country_plot(countries[k])
}

## If Else loop ----

dir.create("developed")
dir.create("developing")

is_developed <- function(Cntry){
  gapminder %>% 
    filter(country==Cntry) %>% 
    summarise(
      mean_gdp = mean(gdpPercap)) %>% 
    .$mean_gdp >= threshold #makes the dataframe a value
  
}

is_developed("Peru", threshold = 2000)
is_developed("United States")







