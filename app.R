library(shiny)
library(shinydashboard)
library(tidyverse)
library(dplyr)
library(readr)
library(DT)
source("~/132/PSET 4/Heating for Shiny.R")
source("~/132/PSET 4/For Shiny/tabs.R")

ui <- dashboardPage(
    skin = "purple",
    dashboardHeader(title = "Estimating Demand", titleWidth = 300),
    
    dashboardSidebar(
        sidebarMenu(id = "sidebarmenu",
                    menuItem("Heating System Demand", tabName = "tab1", icon = icon("home", lib = "font-awesome"),
                             menuItem("Welcome", tabName = "tabW", icon = icon("home", lib = "font-awesome")),
                             menuItem("Multinomial Logit", tabName = "tab2", icon = icon("ellipsis-h", lib = "font-awesome")),
                             menuItem("Nested Logit", tabName = "tab3", icon = icon("project-diagram", lib = "font-awesome")),
                             menuItem("Comparison", tabName = "tab4", icon = icon("comment-alt", lib = "font-awesome"))),
                    menuItem("OTC Pain Meds", tabName = "tap1", icon = icon("capsules", lib = "font-awesome"),
                             menuItem("Multi-Product", tabName = "tap2", icon = icon("cubes", lib = "font-awesome"), 
                                      menuItem("LA-AIDS", tabName = "tap2a",
                                               menuSubItem("Standard", tabName = "tap2i"),
                                               menuSubItem("Cost IV", tabName = "tap2ii"),
                                               menuSubItem("Hausman IV", tabName = "tap2iii")), 
                                      menuItem("Middle Level", tabName = "tap2b"),
                                      menuItem("Upper Level", tabName = "tap2c")),
                             menuItem("Single-Product", tabName = "tap3", icon = icon("cube", lib = "font-awesome")),
                             menuItem("Comparison", tabName = "tap4", icon = icon("comment-alt", lib = "font-awesome"))))
        ),
    
    dashboardBody(
        
        tabItems(
            tabWelcome,
            #fluidRow(
            #    box(title = 4, width = 4),
            #    box(title = 5, width = 4),
            #    box(title = 6, width = 4)),
            tabItem(tabName = "tab2",
                    h2("Multinomial Logit Estimations")
                    #fluidRow(
                    #    tabBox(title = "MNL Variant", id = "tabset",
                    #           tabPanel("MNL 1", "V_ij = b1*ic + b2*oc"),
                    #           tabPanel("MNL 2", "V_ij = b1*ic + b2*oc + b3 + b4 + b5 + b6 + b7")))
                    ),
            tabItem(tabName = "tab3",
                    h2("Nested Logit Estimation")),
            tabItem(tabName = "tab4",
                    h2("Which Worked Better?"), 
                    h3("Evaluation of the models"))
            )
        )
)


server <- function(input, output) {
    
    output$table <- renderDataTable(
        heat_data
    )

}

shinyApp(ui = ui, server = server)










