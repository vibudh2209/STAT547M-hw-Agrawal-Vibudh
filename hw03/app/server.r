library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)
server <- function(input, output) {
	filtered <- reactive({
		bcl %>%
			filter(Price >= input$PriceInput[1],
						 Price <= input$PriceInput[2],
						 Type %in% input$typeInput) %>% 
			{if(input$Order) arrange(.,Price) else .} %>% 
			{if(input$OrderSw) arrange(.,Sweetness) else .} %>%
			{if(input$Cont) filter(.,Country %in% input$countryInput) else .} %>% 
			{if(input$Sub) filter(.,Subtype %in% input$Subtypeinput) else .}
	})
	output$countryOutput <- renderUI({
		selectInput("countryInput", "Country",
								sort(unique(filter(bcl,
																	 Type %in% input$typeInput,
																	 Price >= input$PriceInput[1],
																	 Price <= input$PriceInput[2])$Country)),multiple = TRUE,
								selected = "CANADA")
	})
	output$Subtypel<- renderUI({
		selectInput("Subtypeinput","Subtypes",
								unique(filter(bcl,
															Type %in% input$typeInput,
															Price >= input$PriceInput[1],
															Price <= input$PriceInput[2])$Subtype),selected= "NULL")
	})
	output$PriceOutput <- renderUI({
		sliderInput("PriceInput", "Price Range", min = 0,
								max = input$num, value = c(25,50),pre="$")
	})
	output$Downloaddata <- downloadHandler(
		filename=function(){
			paste("data_",input$PriceInput[1],"_",input$PriceInput[2],".csv")
			},
		content = function(con){
			write.csv(filtered(),con)
			}
		)
	output$coolplot <- renderPlot({
		if (is.null(filtered())) {
			return()
		}
		ggplot(filtered(), aes(Alcohol_Content)) +
			geom_histogram()
	})
	output$results <- DT::renderDataTable({
		filtered()
	})
}