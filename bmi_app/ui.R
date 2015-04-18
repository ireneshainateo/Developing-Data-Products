shinyUI(fluidPage(
        titlePanel("Body Mass Index Calculator"),
        
        sidebarLayout(position = "right", sidebarPanel(
                
                helpText("The body mass index (BMI) is a measure of relative weight based on an individual's mass and height."),
                
                radioButtons(
                        inputId  = "units",
                        label    = "Units:",
                        choices  = c("Metric (kg & m)" = 1, "Imperial (lb & in)" = 2),
                        selected = 1
                ),
                
                numericInput(
                        inputId = "mass",
                        label = strong("Your weight:"),
                        value = 60
                ),
                
                numericInput(
                        inputId = "height",
                        label = strong("Your height:"),
                        value = 1.70,
                        step  = 0.10
                )
                ),
                
                mainPanel(
                        uiOutput("input"),
                        uiOutput("result"),
                        uiOutput("graph"),
                        uiOutput("fork")
                ))
))