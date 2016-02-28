require(shiny)
require(ggplot2)
require(dplyr)

shinyServer(
    function(input, output) {
        output$tgplot <- renderPlot({
            # Convert to a table for our ease of analaysis
            toothtbl <- tbl_df(ToothGrowth)

            if (input$vc_type == "AL" && input$vc_dose == "All") {

                p3 <- ggplot(toothtbl,
                             aes(x=factor(dose),y=len,fill=factor(dose))) +
                    geom_boxplot(notch=F) +
                    facet_grid(.~supp) +
                    ggtitle("Effect of Supplement Type by Dose on Growth") +
                    labs(x = "Level of Dose (mg/day)", y = "Length of Tooth") +
                    theme(plot.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=18,
                                                    hjust=0)) +
                    theme(axis.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=14))

                print(p3)
            } else if (input$vc_type == "AL") {
                #tgdose <- ToothGrowth[ToothGrowth$dose == input$vc_dose,]
                tgdose <- toothtbl[toothtbl$dose == input$vc_dose,]

                p3 <- ggplot(tgdose,
                             aes(x=factor(dose),y=len,fill=factor(dose))) +
                    geom_boxplot(notch=F) +
                    facet_grid(.~supp) +
                    ggtitle(paste("Effect of Supplements at given Dose: ",
                                  input$vc_dose)) +
                    labs(x = "Level of Dose (mg/day)", y = "Length of Tooth") +
                    theme(plot.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=18,
                                                    hjust=0)) +
                    theme(axis.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=14))

                print(p3)
            } else if (input$vc_dose == "All") {
                tgsupp <- toothtbl[toothtbl$supp == input$vc_type,]

                p3 <- ggplot(tgsupp,
                             aes(x=factor(dose),y=len,fill=factor(dose))) +
                    geom_boxplot(notch=F) +
                    ggtitle(paste("Effect on Growth for Supplement: ",
                                  input$vc_type)) +
                    labs(x = "Level of Dose (mg/day)", y = "Length of Tooth") +
                    theme(plot.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=18,
                                                    hjust=0)) +
                    theme(axis.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=14))
                print(p3)

            } else {
                tgsub <- subset(ToothGrowth, supp == input$vc_type & dose == input$vc_dose)

                p3 <- ggplot(tgsub,
                             aes(x=factor(dose),y=len,fill=factor(dose))) +
                    geom_boxplot(notch=F) +
                    ggtitle(paste("Effect of Supplement: ",
                                  input$vc_type, "At Dose: ", input$vc_dose)) +
                    labs(x = "Level of Dose (mg/day)", y = "Length of Tooth") +
                    theme(plot.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=18,
                                                    hjust=0)) +
                    theme(axis.title = element_text(family = "Trebuchet MS",
                                                    color="#666666",
                                                    face="bold",
                                                    size=14))

                print(p3)
            }
        })
    }
)
