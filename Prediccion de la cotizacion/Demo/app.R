library(shiny)

ui <- fluidPage(
    titlePanel("Título de la App"),
    sidebarLayout(
        sidebarPanel(
            actionButton("accion","Clicar")
        ),
        mainPanel(
            h1("Título de nivel uno"),
            textOutput("texto")
        )
    )
)

server <- function(input, output) {
    
    datos = eventReactive(input$accion,{
        x = sample(50)
    })
    
    output$texto = renderText(
        datos()
    )

    output$distPlot <- renderPlot({
        
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = 10 + 1)

        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

shinyApp(ui = ui, server = server)
