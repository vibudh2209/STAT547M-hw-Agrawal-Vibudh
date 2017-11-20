# Hi Welcome to Hw03 

Link to [UI.r](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/app/ui.r)

Link to [server.r](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/app/server.r)

Link to [hosted app](https://vibudh-applications.shinyapps.io/BC_Liqour/)

# Detailed explanation of Things implimented

**I started with what we did in class:**

UI:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/UI.png?raw=true)

Server:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Server.png?raw=true)

### The following changes were made:

- Add an option to sort the results table by price [here](#Head1)
- Add an image of the BC Liquor Store to the UI [here](#Head2)
- Use the DT package to turn the current results table into an interactive table [here](#Head3)
- Place the plot and the table in separate tabs [here](#Head4)
- Allow the user to download the results table as a ..csv file [here](#Head5)
- When the user wants to see only wines, show a new input that allows the user to filter by sweetness level. Only show this input if wines are selected [here](#Head6)
- Allow the user to search for multiple alcohol types simultaneously, instead of being able to choose only wines/beers/etc [here](#Head7)
- If you look at the dataset, you’ll see that each product has a “type” (beer, wine, spirit, or refreshment) and also a “subtype” (red wine, rum, cider, etc.). Add an input for “subtype” that will let the user filter for only a specific subtype of products. Since each type has different subtype options, the choices for subtype should get re-generated every time a new type is chosen [here](#Head8)
- Provide a way for the user to show results from all countries (instead of forcing a filter by only one specific country) [here](#Head9)


### The Process [here](#Head)

### The resources [here](#Headd)


<a name=Head1>
</a>

### Add an option to sort the results table by price

- In UI I added The following:

*checkboxInput("Order","Increasing Price order",FALSE)*

- In Server under filter pipeline I added:

*{if(input$Order) arrange(.,Price) else .}*

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Price_sort.png?raw=true)



<a name=Head2>
</a>

### Add an image of the BC Liquor Store to the UI

- The following thing I added in UI:

*div(img(src = "bc-liq.jpg",height=200),style="text-align: center;"),*

*div(img(src = "bc-liq2.jpeg",height=200),style="text-align: center;")*

     - "Style" is for centring the images

bc-liq.jpg:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/app/www/bc-liq.jpg?raw=true)


bc-liq2.jpeg

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/app/www/bc-liq2.jpeg?raw=true)


<a name=Head3>
</a>

### Use the DT package to turn the current results table into an interactive table

- The following thing I added in UI:

*DT::dataTableOutput("results")*

- The following thing I added in Server:

*DT::renderDataTable({filtered()})*

<a name=Head4>
</a>

### Place the plot and the table in separate tabs

- The following thing I added in UI:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Sep_tabs.png?raw=true)

<a name=Head5>
</a>

### Allow the user to download the results table as a ..csv file

- The following thing I added in UI:

*downloadButton("Downloaddata","Download liqours in specified input")*

- The following thing I added in Server:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Download_tab.png?raw=true)


<a name=Head6>
</a>

### When the user wants to see only wines, show a new input that allows the user to filter by sweetness level. Only show this input if wines are selected

- The following thing I added in UI:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Sweet_tab.png?raw=true)

- The following thing I added in filtered pipeline in Server:

*{if(input$OrderSw) arrange(.,Sweetness) else .}*

    - The image of code

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Sweetser.png?raw=true)


<a name=Head7>
</a>

### Allow the user to search for multiple alcohol types simultaneously, instead of being able to choose only wines/beers/etc

- The following thing I added in UI:

*checkboxGroupInput()* instead of *radioButtons()*

- The following thing I added in Server:

*Type %in% input$typeInput* instead of *Type == input$typeInput* inside filter


<a name=Head8>
</a>

### If you look at the dataset, you’ll see that each product has a “type” (beer, wine, spirit, or refreshment) and also a “subtype” (red wine, rum, cider, etc.). Add an input for “subtype” that will let the user filter for only a specific subtype of products. Since each type has different subtype options, the choices for subtype should get re-generated every time a new type is chosen

- The following thing I added in UI:

     - First I let user decide whether they want to search sub-types

*checkboxInput("Sub","Filter by Subtypes",FALSE)*

     - Then I add a conditional panel 

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/Subtyp.png?raw=true)

- The following thing I added in Server:

     - First change in filter pipeline I added:

*{if(input$Sub) filter(.,Subtype %in% input$Subtypeinput) else .}*

     - As uiOutput so also added:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/SubtypSer.png?raw=true)

     - In here only the sub categories which are within the price range as well as type are displayed


<a name=Head9>
</a>

### Provide a way for the user to show results from all countries (instead of forcing a filter by only one specific country)

- The following thing I added in UI:

     - First I let user decide whether they want to search country wise

*checkboxInput("Cont","Filter by Country",FALSE)*

     - Then I add a conditional panel 

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/country.png?raw=true)

- The following thing I added in Server:

     - First change in filter pipeline I added:

*{if(input$Cont) filter(.,Country %in% input$countryInput) else .}*

     - As uiOutput so also added:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw03/Extra_Images/country1.png?raw=true)

     - In here only the sub categories which are within the price range as well as type are displayed as well as user can select more than one country as input

<a name=Head>
</a>

# The process

- It was fun making a App just using R and not HTML directly, It took some time to get use to all the different input and output formats
- Putting a download button took sometime as I was not sure why they were using function for content and filename and not directly
- Thinkin about how to implement sub_type also took sometime
- Rest all were just basic additions

<a name=Headd>
</a>

# Resources used

- The basic structure was from [notes](http://stat545.com/shiny01_activity.html#final-shiny-app-code)
- For CheckBoxInput I used [this](https://shiny.rstudio.com/reference/shiny/latest/checkboxInput.html)
- For Centering image [this](https://stackoverflow.com/questions/34663099/how-to-center-an-image-in-a-shiny-app)
- For tablePanel i used [this](https://shiny.rstudio.com/reference/shiny/1.0.5/tabsetPanel.html)
- For Download button I used [this](https://shiny.rstudio.com/reference/shiny/0.14/downloadHandler.html)
- For Conditional panel [this](https://shiny.rstudio.com/reference/shiny/0.11/conditionalPanel.html)



