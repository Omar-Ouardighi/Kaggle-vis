ui <- dashboardPage(
  dashboardHeader(title = "2022 Kaggle Survey"),
  dashboardSidebar(
    selectInput("continents", label = "Which continent",
                choices = c('Africa','Asia','Europe','North America', 'South America', 'Oceania'),
                selected = 'Asia'), width = 150
  ),
  dashboardBody(
    fluidRow(
      column( width = 12, 
              tabBox( width = 500,
                      
                      tabPanel("Kaggle's Popularity in the World",plotOutput("plot1")),
                      tabPanel("Ratio of people under 40 in every Country", plotOutput("plot3"))
              ),  
      )),
    fluidRow(
      column( width = 12,
              box(plotOutput("plot2" )),
              box(plotOutput("plot4"))
      ))
  )
)