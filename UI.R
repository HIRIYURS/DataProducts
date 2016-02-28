require(shiny)
require(datasets)
data(ToothGrowth)

shinyUI(pageWithSidebar(
    headerPanel(div("The Effect of Vitamin C on Tooth Growth in Guinea Pigs",
                    style = "color:green")),
    sidebarPanel(
        div(h2("Criteria"), style = "color:blue"),
        #del_type <- levels(ToothGrowth$supp),
        #selectInput('vcdel_type', 'Delivery Method:', choices = del_type),
        radioButtons('vc_type', 'Delivery Method:',
                                 choices = c("Orange Juice (OJ)" = "OJ", "Vitamin C (VC)" = "VC",
                                             "Both" = "AL")),
        selectInput('vc_dose', 'Dose (mg/day):',
                    choices = c("0.5", "1", "2", "All")),
        submitButton("Submit")
    ),
    mainPanel(
        div(h3("Tooth Length against Dose/Supplement"), style = "color:blue"),
        plotOutput("tgplot"),

        div(h4("Please select your choice of input for Supplement Type and the Level of Dose."),
            style = "color:brown"),
        div(h4("Once you hit the submit button, you will see the box plot showing the response (Tooth length)
           to the selected Supplment and Dose"), style = "color:brown"),
        div(h6("In this Shiny App, we are going to analyze the ToothGrowth data from the R datasets package."),
            style = "color:green"),
        div(h6("We try to plot the length of the teeth for given supplement type and level of dose."),
            style = "color:green"),
        div(h6("The description of data provided in the ToothGrowth dataset has been given below:"),
            style = "color:green"),
        div(h6("A data frame with 60 observations on 3 variables - Tooth length,
           Supplement Type (OJ or VC) and the level of Dose (mg/day)"),
            style = "color:green"),
        div(h6("The response is the length of odontoblasts (teeth) in each of 10 guinea pigs
           at each of three dose levels of Vitamin C (0.5, 1, and 2 mg) with each of two
           delivery methods (orange juice or ascorbic acid)."), style = "color:green")
    )
))

