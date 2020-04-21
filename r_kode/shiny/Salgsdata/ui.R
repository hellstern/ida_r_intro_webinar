# ui.R
# Salgsdata
# Tue Hellstern
#

library(readxl)
library(ggplot2)
library(shiny)

salg <- read_excel("~/GitHub/ida_r_intro_webinar/r_kode/webinar_data.xlsx", sheet = "salgs_data")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    titlePanel("Salg efter land"),

    # Opret sidebar
    sidebarLayout(
        sidebarPanel(helpText("Du skal vælge et land"),
            selectInput("ValgtLand", h3("Vaelg land"),
                        choices = salg$Country,
                        selected = 1)),

        # Placering af Plot
        mainPanel(
            plotOutput("SalgsPlot")
        )
    )
))
