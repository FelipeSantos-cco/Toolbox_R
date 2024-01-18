matris <- function(dados.ok){
  # -> Pacotes Usados
  library(ggplot2)
  library(ggcorrplot)
  
  cor.data <- round(cor(na.omit(dados.ok)),1)
  
  suppressWarnings({ # -> Não exibir mensagens de aviso
    
    ggcorrplot(cor.data,
               legend.title = "Coefficient of \n Correlation",
               hc.order = T,
               type = "lower", 
               lab = T, # ->Exibir Coeficiente de correlação
               method = "circle",  
               lab_size = 3, 
               title = "Correlation between variables", 
               colors = c("#FF2000", "white", "#01d00d"),  
               ggtheme=ggplot2::theme_linedraw,
               digits = 2) 
  })
  
}
