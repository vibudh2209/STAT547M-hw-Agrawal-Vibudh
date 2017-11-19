library("shiny")
library(ggplot2)
library(dplyr)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)
server <- function(input, output) {
	filtered <- reactive({
		if (is.null(input$countryInput)) {
			return(NULL)
		}    
		bcl %>%
			filter(Price >= input$PriceInput[1],
						 Price <= input$PriceInput[2],
						 Type == input$typeInput,
						 Country == input$countryInput
			)
	})
	output$countryOutput <- renderUI({
		selectInput("countryInput", "Country",
								sort(unique(bcl$Country)),
								selected = "CANADA")
	})
	output$PriceOutput <- renderUI({
		sliderInput("PriceInput", "Price Range", min = 0,
								max = input$num, value = c(25,50),pre="$")
	})
	output$coolplot <- renderPlot({
		if (is.null(filtered())) {
			return()
		}
		ggplot(filtered(), aes(Alcohol_Content)) +
			geom_histogram()
	})
	output$results <- renderTable({
		filtered()
	})
}