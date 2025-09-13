library(readxl)
library(moonBook)

data_1Y<- read_excel('./DAT/(XAI)Analysis_sample.xlsx',sheet='1Y(0-0 vs 0-1)')
data_2Y<- read_excel('./DAT/(XAI)Analysis_sample.xlsx',sheet='2Y(0-0 vs 0-1)')
data_1Y_ <-read_excel('./DAT/(XAI)Analysis_sample.xlsx',sheet='1Y(1-1 vs 1-2)')
data_2Y_ <-read_excel('./DAT/(XAI)Analysis_sample.xlsx',sheet='2Y(1-1 vs 1-2)')

################################################ Data preprocess ####################################################

preprocess<- function(dataset){
  nominal_feature<-c('Sex','Blood_type', 'Urine_Protein', 'Urine_SG', 'FH_STK', 'FH_HTDZ', 'FH_HTN',
                     'FH_CC', 'PHX_STK', 'DRUG_STK', 'PHX_HTDZ', 'DRUG_HTDZ', 'PHX_HTN', 'DRUG_HTN',
                     'PHX_HPLPDM', 'DRUG_HPLPDM', 'PHX_PHSS', 'DRUG_PHSS', 'PHX_CC', 'DRUG_CC')
  numeirc_feature<-c('Urine_WBC')
  dataset[nominal_feature]<-lapply(dataset[nominal_feature],factor)
  dataset[numeirc_feature]<-lapply(dataset[numeirc_feature], as.numeric)
  return(dataset)
}

data_1Y<-preprocess(data_1Y)
data_2Y<-preprocess(data_2Y)
data_1Y_<-preprocess(data_1Y_)
data_2Y_<-preprocess(data_2Y_)

################################################# basic statistic ########################################################################

vars <- c(
  'label', "Age","Sex","BFP","BMI","WC","FVC","FEV1_FVC_percent","SBP","DBP","PR",
  "WBC","RBC","Hct","RDW","PLT","Lymphocyte","Monocyte","Eosinophil","Basophil",
  "Blood_type","ESR","CRP","TP","ALB","TBil","DBil","AST","ALT","GGT","ALP",
  "BUN","Cr","eGFR","Uric_Acid","TC","TG","HDL","FBG","HbA1c","Ca","P","Na","K",
  "TSH","FreeT4","T3","AFP","CEA","CA19_9","Helicobacter",
  "Urine_pH","Urine_Protein","Urine_SG","Urine_WBC","Hematuria",
  "DRUG_STK","DRUG_HTDZ","DRUG_HTN","DRUG_HPLPDM","DRUG_PHSS","DRUG_CC",
  "Alcohol","FH_STK","FH_HTDZ","FH_HTN","FH_DM","FH_CC","Smoking","VIA","MIA",
  "PHX_STK","PHX_HTDZ","PHX_HTN","PHX_HPLPDM","PHX_PHSS","PHX_CC"
)

statistic<- function(dataset,file){
  df <- dataset[ , !(names(dataset) %in% "pat_sbst_no")]
  df<-df[, vars]
  statisic_result = mytable(label~.,data=df, show.total=TRUE)
  mycsv(summary(statisic_result), file = sprintf('./result/statistic/%s.csv',file), fileEncoding="CP949")
}


statistic(data_1Y,'data_1Y')
statistic(data_1Y_,'data_1Y_')
statistic(data_2Y,'data_2Y')
statistic(data_2Y_,'data_2Y_')