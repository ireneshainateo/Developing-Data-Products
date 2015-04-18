source("./bmi.R")

shinyServer(function(input, output) {
        output$input <- renderText({
                if (input$units == METRIC) {
                        unit.weight = "kg"
                        unit.height = "m"
                } else {
                        unit.weight = "lb"
                        unit.height = "in"
                }
                
                paste0("You are ", "<strong>",input$mass, " ", unit.weight, " at ", input$height, " ", unit.height, "</strong>")
        })
        
        output$result <- renderText({
                bmi = bmi(mass = input$mass, height = input$height, units = input$units)
                
                if      (bmi <  15.0) info = "<span style='color: blue'>Very severely underweight</span>"
                else if (bmi <= 16.0) info = "<span style='color: blue'>Severely underweight</span>"
                else if (bmi <= 18.5) info = "<span style='color: blue'>Underweight</span>"
                else if (bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
                else if (bmi <= 30.0) info = "<span style='color: yellow'>Overweight</span>"
                else if (bmi <= 35.0) info = "<span style='color: orange'>Obese Class I (Moderately obese)</span>"
                else if (bmi <= 39.0) info = "<span style='color: orange'>Obese Class II (Severely obese)</span>"
                else                  info = "<span style='color: red'>Obese Class III (Extremely obese)</span>"
                
                paste0("Your BMI is ", "<code>", round(bmi, 2), "</code>", ", which is: ", info)
        })
        
        output$graph <- renderText({
                "<img style='width: 40em; margin-top: 1em' src='http://calculatorcroc.com/images/bmi_chart.jpg' title='Body mass index chart' />"
        })
        
        
})