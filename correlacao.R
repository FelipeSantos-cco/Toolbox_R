matriz <- function(dados.ok){
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

rank <- function(dados.ok, top = 10, filtro = NULL){
  #install.packages("lares")
  library(lares)
  
  if(is.null(filtro)){
    corr_cross(
      dados.ok,
      rm.na = T,
      grid = T,
      top = top,
      max_pvalue = 0.05,
      quiet = T
    )
  } else {
    corr_cross(
      dados.ok,
      contains = filtro,
      rm.na = T,
      grid = T,
      top = top,
      max_pvalue = 0.05,
      quiet = T
    )
  }
  
  
}