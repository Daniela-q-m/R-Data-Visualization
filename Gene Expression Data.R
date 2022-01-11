#Import libraries
library(ggplot2)
library(plotly)
#Open sample gene expression data
df1<-read.csv('/Users/danielaquijano/Downloads/d.csv')
View(df1)

# Sort by most expressed genes
df2 <-df1[order(-df1$UT1, -df1$UT2,-df1$UT3,-df1$NC1,-df$NC2,-df$NC3),]
head(df2)

#Make Bar Plot

fig <- plot_ly(
  x = c(df2$gene_name[1:50]),
  y = c(df2$UT1[1:50]),
  name = "UT1",
  type = "bar"
)
fig <- fig %>% add_trace(y = df2$UT2[1:50], name = 'UT2', marker = list(color = 'rgb(204,204,204)'))

fig <- fig %>% layout(title = "Gene Expression Data",
                      xaxis = list(title = "Gene Names"),
                      yaxis = list(title = "Gene Counts"))
fig
