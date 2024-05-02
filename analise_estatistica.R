
# Análise Descritiva do conjunto de dados do IBGE

# Importar biliotecas
library(ggplot2)
library(tidyverse)
library(dplyr)

# Carregar o dataset
analise <- read.csv("dados.csv")

# Visualizar o conteúdo do Dataset
str(analise)

head(analise)

# Breve análise estatística
summary(analise)

# Análise DESCRITIVA simples da variável Renda
mean(analise$Renda)
median(analise$Renda)
min(analise$Renda)
max(analise$Renda)


# Desvio padrão da variável Renda
sd(analise$Renda)

# Avaliar o comportamento da variável Renda por meio de uma tabela
# de frequências

classes <- c(min(analise$Renda),
             2 * 788,
             5 * 788,
             15 * 788,
             25 * 788,
             max(analise$Renda))

# Printar 
classes

# Definir os labels das classes
labels <- c('E', 'D', 'C', 'B','A')
labels

# Construir a coluna de frequências das classes
# O CUT permite realizar a a contagem de frequência. 
frequencia <- table(cut(
  x = analise$Renda,
  breaks = classes,
  labels = labels,
  include.lowest = TRUE))

frequencia 
# total de frequência nas classes
#  E     D     C     B     A 
# 49755 18602  7241   822   420 

# Construir a coluna de percentuais
percentual <- prop.table(frequencia) * 100
percentual

# Juntar as colunas de frequências e percentuais e ordenar as linhas de acordo com
# os labels
renda_freq_perc <- cbind('Frequencia' = frequencia, 'Porcentagem (%)' = percentual)
renda_freq_perc

# Ordenar 
renda_freq_perc <- renda_freq_perc[order(rownames(renda_freq_perc)), ]

# Criar data frame para plotagem
bar_chart <- data.frame(renda_freq_perc)
bar_chart

# Gráfico de barras com ggplot (mais elaborado) para visualização
ggplot(bar_chart, aes(x = row.names(bar_chart), y = bar_chart$Frequencia)) +
  geom_bar(stat = "identity") +
  ylab("Frequência") + 
  xlab("Classes de Renda") + 
  ggtitle('Gráfico Classes de Renda')

# Obter a MODA da variável Renda
moda <- function(x) {
  frequencia <- table(x)
  return(names(frequencia)[frequencia == max(frequencia)])}

# Contagem da moda 
as.numeric(moda(analise$Renda))

# Obter a VARIÂNCIA da variável Renda
var(analise$Renda)

# Obter o DESVIO PADRÃO da variável Renda
sd(analise$Renda)

# ---------- Histogramas das variáveis quantitativas------------

# Variável Idade
ggplot(analise, aes(x = Idade)) + 
  geom_histogram(bins = 50) + 
  ylab("Frequência") + 
  xlab("Idades") + 
  ggtitle('Histograma das Idades')

# Variável Altura
ggplot(analise, aes(x = Altura)) + 
  geom_histogram() + 
  ylab("Frequência") + 
  xlab("Altura") + 
  ggtitle('Histograma das Alturas')

# VAriável Renda
ggplot(analise, aes(x = Renda)) + 
  geom_histogram(bins = 100) + 
  ylab("Frequência") + 
  xlab("R$") + 
  ggtitle('Histograma das Rendas')

# Variável Renda com informações das pessoas com rendimento abaixo de 20.000
ggplot(analise[analise$Renda < 20000, ], aes(x = Renda)) + 
  geom_histogram() + 
  ylab("Frequência") + 
  xlab("R$") + 
  ggtitle('Histograma das Rendas - Pessoas com renda até R$ 20.000,00') 

# ---------------------- Análise de Relação -----------------------
# Construção de uma tabela de frequência 
sexo = c(
  'Masculino', 
  'Feminino')

cor = c(
  'Indígena', 
  'Branca', 
  'Preta', 
  'Amarela', 
  'Parda')

anos_de_estudo = c(
  'Sem instrução e menos de 1 ano', 
  '1 ano', 
  '2 anos', 
  '3 anos', 
  '4 anos', 
  '5 anos', 
  '6 anos', 
  '7 anos', 
  '8 anos', 
  '9 anos', 
  '10 anos', 
  '11 anos', 
  '12 anos', 
  '13 anos', 
  '14 anos', 
  '15 anos ou mais', 
  'Não determinados')

# Transformar a variável binária em categórica com Factor
analise$cat_sexo <- factor(analise$Sexo)
levels(analise$cat_sexo) <- sexo

# Transformar a variável COR em categórica com Factor
analise$cat_cor <- factor(analise$Cor)
levels(analise$cat_cor) <- cor

# Transformar a variável Anos de Estudo em categórica com Factor
analise$cat_estudos <- factor(analise$Anos.de.Estudo, order = TRUE)
levels(analise$cat_estudos) <- anos_de_estudo

# visualizar o novo conjunto de dados
head(analise)


### --------- Analisar as frequencias das variáveis  -------------------------

# Criar uma tabela para análise de relação Variáveis SEXO E COR 
frequencias <- table(analise$cat_sexo, analise$cat_cor)

# Vincular as colunas para a contagem de frequência
frequencias <- cbind(frequencias)
frequencias

# Criar uma nova tabela com a porcentagem
percentual_2 <- cbind(prop.table(frequencias) * 100)
percentual_2

# Plotar a tabela de frequência como um gráfico de barras
barplot(frequencias, beside = TRUE, legend.text = rownames(frequencias),
        main = "Relação entre Sexo e Cor",
        xlab = "Sexo",
        ylab = "Frequência", 
        col = c("darkblue", "darkred"))


# Plotar a tabela de frequência em porcentagem.
barplot(percentual_2, beside = TRUE, legend.text = rownames(percentual_2),
        main = "Relação entre Sexo e Cor em porcentagem",
        xlab = "Sexo",
        ylab = "Frequência", 
        col = c("darkblue", "darkred"))

#------------ Obter a MÉDIA da variável renda segundo Sexo e Cor --------------

medias <- tapply(analise$Renda, list(analise$cat_cor, analise$cat_sexo), mean)
medias

# Plotar o resultado da MÉDIA
barplot(medias, beside = TRUE, legend.text = rownames(medias), 
        main = "Média de Renda por sexo e cor",
        xlab = "Sexo",
        ylab = "Renda média",
        col = c("darkblue", "darkred", "darkgreen", "darkgray", "skyblue"))


# ----------- Obter a MEDIANA da variável renda segundo Sexo e Cor ------------
mediana <- tapply(analise$Renda, list(analise$cat_cor, analise$cat_sexo), median)
mediana

# Plotar o resultado da MEDIANA
barplot(mediana, beside = TRUE, legend.text = rownames(mediana), 
        main = "Mediana de Renda por sexo e cor",
        xlab = "Sexo",
        ylab = "Mediana",
        col = c("darkblue", "darkred", "darkgreen", "darkgray", "skyblue"))


# ------------ Obter os MÁXIMOS da variável renda segundo Sexo e Cor ----------
maximo <- tapply(analise$Renda, list(analise$cat_sexo, analise$cat_cor), max)
maximo

# Plotar o resultado dos MÁXIMOS
barplot(maximo, beside = TRUE, legend.text = rownames(maximo), 
        main = "Máximo de Renda por sexo e cor",
        xlab = "Sexo",
        ylab = "Máximo",
        col = c("darkblue", "darkred"))


# -------------- Obter a VARIÂNCIA da variável Renda ---------------------
variancia <- tapply (analise$Renda, list(analise$cat_sexo, analise$cat_cor), var)
variancia

# Plotar o resultado 
barplot(variancia, beside = TRUE, legend.text = rownames(variancia), 
        main = "Variância de Renda por sexo e cor",
        xlab = "Sexo",
        ylab = "Variância",
        col = c("darkblue", "darkred"))


# ------------------ Obter O DESVIO PADRÃO da variável Renda -----------------
desvio_padrao <- tapply (analise$Renda, list(analise$cat_sexo, analise$cat_cor), sd)
desvio_padrao

# Plotar o resultado 
barplot(desvio_padrao, beside = TRUE, legend.text = rownames(variancia), 
        main = "Desvio padrão de Renda por sexo e cor",
        xlab = "Sexo",
        ylab = "Desvio padrão",
        col = c("darkblue", "darkred"))


# Gráfico de Barras variável Renda
ggplot(analise, aes(x = Renda)) +
  geom_bar(fill = "skyblue", color = "black") +
  labs(x = "Intervalos de Renda", y = "Frequência", 
       title = "Gráfico de Barras da Renda")

# Histograma da variável Renda com rendimento de até 20.000
ggplot(analise[analise$Renda < 20000, ], aes(x = Renda)) +
  geom_histogram() +
  ylab("Frequência") + 
  xlab("R$") + 
  ggtitle('Histograma das Rendas - Pessoas com renda até R$ 20.000,00')


# ----------------------------------------------------------------------------

# Boxplot com as variáveis Renda, Cor e Sexo
ggplot(analise[analise$Renda < 10000, ], aes(x = cat_cor, y = Renda, fill = cat_sexo)) + 
  geom_boxplot(size = 0.2) + 
  coord_flip() +
  ylab("R$") + 
  xlab("Cor") + 
  guides(fill = guide_legend(title = 'Sexo')) +
  ggtitle('Box-plot da RENDA por SEXO e COR')

# Percentual de pessoas que ganham um salário mínimo (780,00)
length(analise$Renda[analise$Renda <= 788]) / length(analise$Renda) * 100


# Qual valor MÁXIMO ganho por 99% das pessoas do dataset
quantile(analise$Renda, .99)


#### -------------------------------------------------------------- ########

# Obter a MÉDIA, MEDIANA, VALOR MÁXIMO E DESVIO-PADRÃO da variavel 
# Renda segundo Anos de estudo e Sexo

# Obter a Média da Renda segundo Anos de Estudo e Sexo
media_est_cor <-  tapply(analise$Renda, list(analise$cat_estudos, 
                                             analise$cat_sexo), mean)
media_est_cor


# Plotar as médias de renda por nível de estudo e sexo
barplot(media_est_cor, beside = TRUE, 
        main = "Média de Renda por Nível de Estudo e Sexo", 
        xlab = "Nível de Estudo", 
        ylab = "Renda Média", col = c("darkgray"))


# Obter as MEDIANAS DA RENDA segundo Anos de Estudo e Sexo
medianas_2 <- tapply(analise$Renda, list(analise$cat_estudos, analise$cat_sexo), median)
medianas_2

# Obter os MÁXIMOS da variável renda segundo Anos de Estudo e Sexo
maximos_2 <- tapply(analise$Renda, list(analise$cat_estudos, analise$cat_sexo), max)
maximos_2

#  Obter o DESVIO PADRÃO da variável renda segundo Anos de Estudo e Sexo
desvio_padrao_2 <- tapply(analise$Renda, list(analise$cat_estudos, analise$cat_sexo), sd)
desvio_padrao_2


# Construir um box plot da variável renda segundo Anos de Estudo e Sexo 
# renda menor que 10.000

ggplot(analise[analise$Renda < 10000, ], aes(x = cat_estudos, y = Renda, fill = cat_sexo)) + 
  geom_boxplot(size = 0.2) + 
  coord_flip() +
  ylab("R$") + 
  xlab("Anos de Estudo") + 
  guides(fill = guide_legend(title = 'Sexo')) +
  ggtitle('Boxplot da RENDA por SEXO e ANOS de ESTUDO')


## FIm

