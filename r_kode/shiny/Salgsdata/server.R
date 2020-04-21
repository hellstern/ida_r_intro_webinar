# server.R
# Salgsdata
# Tue Hellstern


library(readxl)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(shiny)

salg <- read_excel("~/GitHub/ida_r_intro_webinar/r_kode/webinar_data.xlsx", sheet = "salgs_data")

# Define server logic required to draw a histogram
function(input, output) {

    output$selected_var <- renderText({
        paste("Valg af land", input$ValgtLand)
    })

    output$SalgsPlot <- renderPlot({

        # Opret barplot
        dplyr::filter(salg, Country == input$ValgtLand) %>%
            ggplot(aes(x=Salesperson, y=Sale)) +
            geom_bar(stat = "identity", fill="blue") +
            ylab("Salg i kr.") +
            xlab("Saelger") +
            theme_economist()
})
}
