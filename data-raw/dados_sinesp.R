## code to prepare `dados_sinesp` dataset goes here
library(ggplot2)


usethis::use_data(dados_sinesp, overwrite = TRUE)


#Importação

caminho <- "data-raw/indicadoressegurancapublicamunicmar20.xlsx"

dados_sinesp <- read_excel("data-raw/indicadoressegurancapublicamunicmar20.xlsx")

abas <- excel_sheets("data-raw/indicadoressegurancapublicamunicmar20.xlsx")

dados_sinesp <- map(
  abas,
~read_excel(caminho,sheet = .x,col_types = c("text","text","text","date","numeric"))
)

dados_sinesp <- bind_rows(dados_sinesp)



#Arrumação

dados_sinesp <-clean_names(dados_sinesp)


write_rds(dados_sinesp,"main-r4ds-2-master/data/dados_sinesp.rds",
          compress = "gz")
  
install.packages("janitor")
library(janitor)




dados_sinesp %>% 
  filter(municipio == "Belo Horizonte") %>% 
  ggplot()+
  geom_line(aes(x = mes_ano,y=vitimas))


