# ui.R
# Salgsdata
# Tue Hellstern
#

library(readxl)
library(ggplot2)
library(shiny)

salg <- read_excel("webinar_data.xlsx", sheet = "salgs_data")

# UI
shinyUI(fluidPage(

    titlePanel("Salg efter land"),

    # Opret sidebar
    sidebarLayout(
        sidebarPanel(helpText("Du skal vælge et land"),
            selectInput("ValgtLand", h3("Vælg land"),
                        choices = salg$Country,
                        selected = 1)),

        # Placering af Plot
        mainPanel(
            plotOutput("SalgsPlot")
        )
    )
))
