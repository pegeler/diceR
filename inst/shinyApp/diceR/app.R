library(shiny)
library(diceR)

ui <- fluidPage(
    titlePanel("diceR"),
    sidebarLayout(
        sidebarPanel(
            numericInput("n", "Number of Dice", value = 2,
                         min = 1, max = 100, step = 1L),
            numericInput("faces", "Faces per Die", value = 6,
                         min = 2, max = 1e5, step = 1L),
            actionButton("roll", "Roll")
        ),
        mainPanel(
            verbatimTextOutput("result")
        )
    )
)

server <- function(input, output) {
    res <- eventReactive(input$roll, {
        input$n %d% input$faces
    })

    output$result <- renderText({
        capture.output(print(res()))
    })
}

shinyApp(ui = ui, server = server)
