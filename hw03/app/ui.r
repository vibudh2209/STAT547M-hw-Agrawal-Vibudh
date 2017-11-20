ui <- fluidPage(
	div(img(src = "bc-liq.jpg",height=200),style="text-align: center;"),
	div(img(src = "bc-liq2.jpeg",height=200),style="text-align: center;"),
		sidebarLayout(
		sidebarPanel(
			checkboxGroupInput("typeInput", "Product type", 
									 choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"), 
									 selected = "WINE"),
			checkboxInput("Sub","Filter by Subtypes",FALSE),
			conditionalPanel(
				condition="input.Sub==1",
				uiOutput("Subtypel")
			),
			checkboxInput("Cont","Filter by Country",FALSE),
			conditionalPanel(
				condition="input.Cont==1",
				uiOutput("countryOutput")
			),
			numericInput("num", "Maximum price range", 100),
			uiOutput("PriceOutput"),
			checkboxInput("Order","Increasing Price order",FALSE),
			conditionalPanel(
				condition="input.typeInput=='WINE'",
				checkboxInput("OrderSw","Increasing swetness order",FALSE)
			),
			downloadButton("Downloaddata","Download liqours in specified input")
		),
		mainPanel(
			tabsetPanel(
				tabPanel("Alcohol Content",plotOutput("coolplot")),
				tabPanel("All results Tabulated",DT::dataTableOutput("results"))
			)
		)
	)
)