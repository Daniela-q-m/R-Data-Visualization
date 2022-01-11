library(ggplot2)
library(plotly)

df1<-read.csv('/Users/danielaquijano/Downloads/d.csv')
View(df1)



# Sort by c3 and c4
df2 <-df1[order(-df1$UT1, -df1$UT2),]
head(df2)


gene_names<-df1[1]
first_condition<-c(df1[3])
second_condition<-c(df[4])
third_condition<-c(df[5])
fourth_condition<-c(df[6])
fifth_condition<-c(df[7])
sixth_condition<-c(df[8])



library(plotly)

fig <- plot_ly(
  x = c(df2$gene_name[1:10]),
  y = c(df2$UT1[1:10]),
  name = "Group 1",
  type = "bar"
)
fig <- fig %>% add_trace(y = df2$UT2[1:10], name = 'Group 2')

fig
