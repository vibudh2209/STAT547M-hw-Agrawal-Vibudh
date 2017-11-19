ui <- fluidPage(
	titlePanel("Bc Liquor Store prices"),
	sidebarLayout(
		sidebarPanel(
			radioButtons("typeInput", "Product type", 
									 choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"), 
									 selected = "WINE"),
			uiOutput("countryOutput"),
			numericInput("num", "Maximum slider value", 100),
			uiOutput("PriceOutput")
		),
		mainPanel(
			plotOutput("coolplot"),
			br(),
			br(),
			tableOutput("results")
		)
	)
)