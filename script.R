library(tidyverse)
library(readxl)

data = BlueSky_Single_Leg_demand

colnames(data)[2] <- "demanda"
colnames(data)[1] <- "data"

## Gráfico ####

g <- ggplot(data, aes( x = data, y = demanda)) + geom_point() + geom_line()
g

# valor crítico

tarifa.full <- 174
tarifa.low <- 114

valor.critico <- (tarifa.full - tarifa.low)/(tarifa.full)

# Modelo 1 - Normal ####

media_1 <- mean(data$demanda) 

m_int <- round(media_1,0)

g <- g + geom_hline(yintercept = media_1, color = "blue")

g

# Desvio Padrão ####

rmse_1 <- sd(data$demanda)

protection_level_1 <- qnorm(p = valor.critico, mean = meadia_1, sd = rmse_1)

protection_level_1 <- round(protection_level_1, 0)


