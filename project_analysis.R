#install packages
install.packages("BiocManager")

#install data set
BiocManager::install("airway")

#load libraries
library(tidyverse)
library(dplyr)
library(BiocManager)
library(airway)
library(ggplot2)
library(tibble)
library(ggpubr)

#data set information
data(airway)
head(airway)
summary(airway)

#data cleaning
expression_data<-as.data.frame(assay(airway))
meta_data<-as.data.frame(colData(airway))

#view data
View(expression_data)
View(meta_data)

#extracting row names
expression_data$genes<-rownames(expression_data)
View(expression_data)

#creating Mean_expression
expression_data<-expression_data %>%
  mutate(mean_expression=rowMeans(select(.,-genes))) %>%
  arrange(desc(mean_expression))

View(expression_data)

#selecting highly expressed genes
high_genes<- expression_data %>%
  filter(mean_expression>=143250.62) %>%
  select(genes,mean_expression)
  
print(high_genes)

#convert meta data row names
meta_data<-meta_data %>%
  rownames_to_column(var="rownames") #for creating longer data

View(meta_data)

#combining with meta data
combined_data<-pivot_longer(expression_data,-c(genes,mean_expression),names_to="samples",
                            values_to="expression") %>%
  left_join(meta_data, by=c("samples" = "rownames"))
  
            
View(combined_data)  


#data visualization using ggplot

#creating bar plot
high_genes %>%
  ggplot(aes(x=reorder(genes,-mean_expression), y=mean_expression,fill="condition"))+
  geom_bar(stat="identity")+
  geom_text(aes(label=round(mean_expression,1), vjust=0))+
  theme_minimal()+
  labs(title="Airway highly expressed genes", x="Genes", y="Mean value")+
  theme(axis.text.x = element_text(angle=45, hjust=1))

#creating box plot
combined_data %>%
  ggplot(aes(x=dex, y=expression, fill=dex))+
  #geom_jitter(width=0.2, alpha=0.5, color="blue")+
  #facet_wrap(~genes)+  #additional visualization if needed
  stat_compare_means(aes(label=..p.signif..), method="t.test")+
  stat_summary(fun=mean, geom="point", shape=23, size=3, fill="white")+
  geom_boxplot(alpha=0.7, color=c(trt="pink",untrt="blue"))+
  theme_minimal()+
  labs(title="Expression based on Treatment", x="Treatment", y="Expression")
    


  
