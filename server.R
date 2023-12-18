
server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    map <- rnaturalearth::ne_countries(scale = 110, 
                                       returnclass = 'sf', 
                                       continent = input$continents) |> 
      left_join(Country2022, by = 'sovereignt') |> 
      
      mutate(Count2022 = ifelse(is.na(Count2022), 0, Count2022))
    
    map |> 
      ggplot() +
      geom_sf(aes(fill = Count2022)) +
      scale_fill_gradient(name = 'Kaggle\'s popularity',low = '#FF3F34', high = '#263252') +
      labs( title = paste("Kaggle's Popularity in",input$continents),
            caption = "Data source: 2022 Kaggle Machine Learning & Data Science Survey ") +
      theme(axis.text.x = element_blank(),axis.text.y = element_blank(),
            axis.ticks = element_blank(),axis.title.x = element_blank(),
            axis.title.y = element_blank(),rect = element_blank(),
            plot.title = element_text(size = 18, colour = "gray35"), 
            plot.caption = element_text(color = "gray65", face = "bold", size = 7))
  })
  output$plot2 <- renderPlot({
    Prog_lang |> 
      filter(count > 1400) |> 
      ggplot( aes(area = count, fill = count, label = languages)) +
      geom_treemap() +
      geom_treemap_text(colour = "white",
                        place = "centre",
                        size = 15) +
      scale_fill_gradient(low='#FF3F34', high = '#263252') +
      labs( title = "Programming Languages used by Kagglers", 
            subtitle = "On a regular basis", caption = "Data source: 2022 Kaggle Machine Learning & Data Science Survey ") +
      theme(legend.position = "none", plot.title = element_text(size = 18, colour = "gray35"), plot.subtitle = element_text(size = 12, colour = "gray62"), 
            plot.caption = element_text(color = "gray65", face = "bold", size = 7))
  }
  )
  output$plot4 <- renderPlot({
    Gender |> 
      ggplot(aes(year, value, colour = Q3)) +
      geom_line(aes(group = Q3)) +
      geom_point(size = 3) +
      scale_color_manual(values=c('#263252', '#FF3F34')) +
      labs(x = "Years", y = "Number Of Participants", title = "Gender Participation through the years", 
           subtitle = "Most of the kagglers are Men (77%) and Female Kagglers are (22%)", 
           caption = "Data source: 2022 Kaggle Machine Learning & Data Science Survey ") +
      
      theme(legend.position = "none", axis.text.y= element_text( size = 10), axis.text.x = element_text(size = 10,
                                                                                                        colour = "gray45"), panel.background = element_rect(fill = "white"),
            plot.background = element_rect(fill = "white"), plot.title = element_text(size = 18, colour = "gray35"),
            plot.subtitle = element_text(size = 12, colour = "gray62"),
            strip.background = element_rect(fill = "white"), 
            axis.line = element_line(size = 0.4, colour = "gray35"), plot.caption = element_text(color = "gray65",
                                                                                                 face = "bold", size = 7), 
            axis.title = element_text(size = 12, colour = "gray25")) +
      inset_element(p = img_woman, align_to = 'plot', left = 0.3,
                    bottom = 0.2,
                    right = 0.25,
                    top = 0.45) +
      inset_element(p = img_man, align_to = 'plot', left = 0.95,
                    bottom = 0.6,
                    right = 0.9,
                    top = 0.83
      ) 
  }
  )
  
  
  
  output$plot3 <- renderPlot({
    ggplot(Country_age, aes(reorder(CountryName, +Lower40yoRatio), Lower40yoRatio, fill = Color))+
      geom_bar(col = "gray10", stat = "identity", width = 0.6)+
      coord_flip()+
      scale_y_continuous(labels = scales::percent, limits = c(0,1.2), breaks = seq(0,0.8,0.2), expand = c(0, 0),)+
      scale_fill_manual(values = c("#263252", "#FF3F34", "gray65")) +
      
      annotate("text", x = 34.1, y = 1.05, label = "The top 10 countries\n with the\n highest rate are in\n Asia or North Africa", 
               fontface = "bold", size = 4, colour = "#263252")+
      annotate("text", x = 1.9, y = 0.64, label = "Last 3 countries are in Europe", fontface = "bold", size = 4, colour = "#FF3F34")+
      
      labs(x = "", y = "Ratio of people under 40 years old among responders", title = "Ratio of people under 40 by countries", 
           subtitle = "In countries with at least 80 respondents", caption = "Data source: 2022 Kaggle Machine Learning & Data Science Survey ") +
      
      theme(legend.position = "none", axis.text.y= element_text(colour = as.list(Country_age)$Color, size = 9), axis.text.x = element_text(size = 10, colour = "gray45"), 
            panel.background = element_rect(fill = "white"), plot.title = element_text(size = 18, colour = "gray35"), plot.subtitle = element_text(size = 12, colour = "gray62"),
            axis.line = element_line(size = 0.4, colour = "gray35"), plot.caption = element_text(color = "gray65", face = "bold", size = 7), axis.title = element_text(size = 10, colour = "gray25"))
  }
  )
}