#ui.R
library(shiny)
library(ggplot2)

dataset <- read.csv("mtcars.csv", header = T)


shinyUI(fluidPage(
    navbarPage("Coursera Developing Data Products Course Project"),
    titlePanel("mtcars Dataset Exploration"),
    sidebarLayout(
        sidebarPanel(
            h3('Play with Plot'),
            sliderInput('sampleSize', 'Choose Sample Size', min=1, max=nrow(dataset),
                        value=min(50, nrow(dataset)), step=1, round=0),
            selectInput('x', 'X', names(dataset), selected = "cyl"),
            selectInput('y', 'Y', names(dataset), selected = "mpg"),
            selectInput('color', 'Color', selected = "am" , c('None', names(dataset))),
            checkboxInput('jitter', 'Jitter'),
            checkboxInput('smooth', 'Smooth'),
            selectInput('facet_row', 'Facet Row', selected = "am", c(None='.', names(dataset))),
            selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
            downloadButton('downloadData', 'Download Train set'),
            tags$br(),
            tags$br(),
            strong('VARIABLE DESCRIPTIONS:'),
            tags$ul(
                tags$li('mpg - Miles/(US) gallon'),
                tags$li('cyl - Number of cylinders'),
                tags$li('disp - Displacement (cu.in.)'),
                tags$li('hp - Gross horsepowe'),
                tags$li('drat - Rear axle ratio'),
                tags$li('wt - Weight (lb/1000)'),
                tags$li('qsec - 1/4 mile time'),
                tags$li('vs - V/S'),
                tags$li('am  -  Transmission (0 = automatic, 1 = manual)'),
                tags$li('gear  - Number of forward gears'),
                tags$li('carb  - Number of carburetors')
            ),
            strong('SPECIAL NOTES:'),
            p('The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). '),
            p('Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411')
            ),

        mainPanel(
            h2('Basic Exploratory Analysis'),
            p('Please note that this is a very basic App intended to provide some introductory (really, really basic) exploratory analysis.'),
            p("It uses solely the dataset available in dataset package in R, which you can download here"),
            h4('Getting Started with this Web App'),
            p('On the side panel you can change the variables that are injected to the plot (from ggplot2 library).'),
            p('You can change which variable go the the X-axis, Y-axis, color by variable, and include jitter, smooth, and row/column facets.'),
            p('Use it to your advantage in order to extract the maximum logic conclusions out of the plot for latter implementation of Machine Learning Algorithms.'),
            strong('About the plot'),
            p('The plot has already some variables choosen by default, to help you interprete the data.'),
            p('From the default settings, the plot is intended to allow the comparison among some variables:'),
            tags$ul(
                tags$li('Compare the impact of cylinders on the mpg ?'),
                tags$li('Compare the impact of transmission on mpg?'),
                tags$li('Compare the impact of wt on mpg?')
            ),

            plotOutput('plot'),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            h4('Training Dataset'),
            p('Finally, you can view the raw training dataset and play with it as well.'),
            tags$br(),
            tabPanel('trainData', dataTableOutput('mytable1'))

        )
            )
            ))
