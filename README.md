# Airway Gene Expression Visualization

## Overview 

This project focuses on gene expression analysis of airway genes, utilizing RNA-seq data to uncover insgights into
gene regulation and differential expression.  The study was conducted using **R programming**, leveraging powerful libraries such as **ggplot2**.
for data visualization.  By analyzing airway-specific gene expression, this project aims to contribute to understanding
biological mechanisms underlying airway diseases and responses to treatments.

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
- [Statistics](#Statistics)
- [Results](#results)
- [Contribution](#contribution)

## Introduction

The **airway** dataset originates from a study that aimed to understand how airway muscle cells respond to treatment with **dexmethasone**.
Airway smooth muscle cells found in the respiratory system controls the tone and diameter of the airways and dysfunction of these
cells is associated with **airway hyperresponsiveness** and remodelling, common in diseases like asthma and chronic obstructive pulmonary disease(COPD)

### Dexamethasone

It is a synthetic glucocortisoid drug with potent anti-inflammatory and immunosuppresssant properties.  Commonly used to treat
by modulating gene expression via the glucocoricoid receptor pathway.

## Dataset

The RNA-seq data in the **airway** dataset was derived from human airway smooth muscle cells, cultured under two conditions:
- 1.**Control group**: Cells not treated with dexamethasone
- 2.**Treated group**: Cells treated with dexamethasone

### structure of dataset

The dataset includes **8 samples**, with four treated and four untreated replicates.  This balanced design allows robust statistical comparisons for differential expression analysis.
The airway dataset is provided as a **SummarizedExperiment** object, which includes:
- 1.Count Matrix - Contains raw counts of RNA-seq reads
- 2.Metadata - Information about experimental design.

### Accessing the data set

- You can download the data set by [clicking here](https://drive.google.com/file/d/1Iszne6emNZu7C0oRUYcb0JngF_sRaLHY/view?usp=sharing)
- Another way, you can access through R:

```R
#Accessing dataset through R:
#Oper R Stiudio

#Installing packages
Install.packages("BiocManager")
BiocManager::install("airway")

#Load data
library(BiocManager)
library(airway)
data(airway)
head(airway)
```

### Installation

**Prerequisites**
Install the following R packages:
   - **tidyverse**: For data manipulation and visualization
   - **ggplot2**: For creating plots
   - **dplyr**: For advanced data cleaning and transformations
   - **airway**: Dataset used for this project (from BiocManager)
   - **BiocManager**: To manage and install Bioconductor packages

**Steps for Installation**
1. Clone this repository
```bash git clone https://github.com/KARTHIK-YOGANANTHAM/GeneExpressionProjects.git
```
2. Open the R script file (project_analysis.R) in RStudio
3. Install the required package and datasets as mentioned in [Dataset](#dataset)
4. Load the necessary libraries:
```R
library(airway)
library(tidyverse)
library(ggplot2)
```

### Usage
1. **Data Loading and Cleaning**
- The script automatically loads the **airway** dataset and processes it for analysis.
- Make sure the script is run from the beginning to clean, filter, and prepare the dataset for visualization.
2. **Data Visualization**
- The script generates multiple plots such as **barplots** and **boxplots** to explore gene expression data.
- To execute the visualizations, run:
```R
source("project_analysis.R")
```
3. **Saving Results**
- All plots are automatically in the **results/plots** folder
- chech the folder for  generated images in **.png** and **.pdf** format.
4. **Customizing Parameters**
- You can modify the script to analyze specific genes or change visualization styles.

### Statistics

Statistical analysis were performed to determine the differences in gene expression between the treatment groupts(**treated**
and **untreated**) and to identify trends or patterns in the data.

**Methods**
- T-Test for group Comparison (**p<_0.05**:significant difference, **p>0.05**: Not significant(ns) )
- p-Value Significance
```R
stat_compare_means(aes(label=..p.sigif..), method="t.test")
```
  - *  = p<_0.05
  - ** = p<_0.01
  - *** = p<_0.001
  - **** = p<-0.0001
  - ns = Not significant(p>0.05)

### Results

1. **Barplot for Highly Expressed Genes**:
   - The top 10 highly expressed genes are visualized with their mean expression values.
   - Insights,
      -   **ENSG00000115114** shows the highest expression with expression values of upto **328812.6**
      -   **ENSG0000016523** has the lowest mean expression value of **143250.6**
      -   **x-axis** displays the unique gene identifiers
      -   **y-axis** shows the mean expression values of each gene, calculated across all samples.


![Project01_barplot](https://github.com/user-attachments/assets/d8fd0be0-8fa3-4b04-8fca-4238f0d9e6bc)

**Figure 1: Barplot shwoing the top 10 highly expressed genes in the Airway dataset.**

2. **Boxplot of Expression by Treatment**:
  - Gene expression distributions are comparedd between treated (**trt**) and untreated(**ntrtu**) samples.
  - Statistical test such as t-tests reveal no significant differences between groups(**ns indicates p>0.05**)
  - Insights,
     - **Boxes** represent the interquartile range(IQR)
     - **Horizontal line** inside each box represent the median value of gene expression
     - **Whiskers** extend to the range of data within 1.5 times the IQR
  - **x-axis** represents two categories of treatment (**trt** for treated, **untrt** for untreated)
  - **y-axies** displays the expression levels of genes, measured numerically.

!![GeneTreatmentBoxplot](https://github.com/user-attachments/assets/f02bf9b3-c740-4a77-8e61-a0316a180632)

### Contribution

We welcome contributions to improve this project.  Here's how you can contribute:

1. **Report Bugs**
   - If you encounter any issues, please create a new issues in the **Issues** tab

2. **Submit Enhancements**
   - Fork the repository:
     ```bash
     git fork https://github.com/KARTHIK-YOGANANTHAM/AirwayGeneExpressionAnalysis.git
     ```
   - create a pull request with a detailed description of your changes
  
### Contact

For any questions, contact me via email: karthikyoganantham23@gmail.com
  




