

rankall<-function(dis, num="best"){
  
#dis="heart attack"
#num=20

  setwd("C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I")
  
  outcome <- read.csv("~/Coursera_Mathhmata/R_Programming/outcome-of-care-measures.csv")
  
  outcome[,11]<-suppressWarnings(as.numeric(as.character(outcome[,11])))
  outcome[,17]<-suppressWarnings(as.numeric(as.character(outcome[,17])))
  outcome[,23]<-suppressWarnings(as.numeric(as.character(outcome[,23])))
  
  
  outcome[,2]<-suppressWarnings(as.character(outcome[,2]))
  
  
  mm<-unique(outcome$State)
  mm<-as.character(mm)
  
  mm<-mm[order(mm)]


  smm<-length(mm)
  

  
  cl<-c("heart attack","heart failure", "pneumonia")
  if(!(dis %in% cl)){
    
    stop("invalid outcome")
    
  }
  
  dat1 <- data.frame()
  
  for(i in 1:smm){
    
    st<-mm[i]  
    
    outcome2<- outcome[ which(outcome$State==st), ]
    
    
    
    
    #outcome2=subset(outcome, outcome$State=="AL")
    
    if(dis=="heart attack"){
      
      outcome2<-outcome2[!(is.na(outcome2[,11]) | outcome2[,11]==""), ]  
      outcome2<-outcome2[ order(outcome2[,11],outcome2[,2]), ]
      
      ms<-dim(outcome2)
      
      dat1[i,1]=NA
      
      if(num=="best") dat1[i,1]=(outcome2[1,2])
      if(num=="worst") dat1[i,1]=(outcome2[ms[1],2])
      if(class(num)=="numeric" && num<=ms[(1)]) dat1[i,1]=(outcome2[num,2])
      
      
      
      
    }
    
    
    if(dis=="heart failure"){
      
      outcome2<-outcome2[!(is.na(outcome2[,17]) | outcome2[,17]==""), ]  
      outcome2<-outcome2[ order(outcome2[,17],outcome2[,2]), ]
      
      
      ms<-dim(outcome2)
      
      dat1[i,1]=NA
      
      
      if(num=="best") dat1[i,1]=(outcome2[1,2])
      if(num=="worst") dat1[i,1]=(outcome2[ms[1],2])
      if(class(num)=="numeric" && num<=ms[1]) dat1[i,1]=(outcome2[num,2])
      
      
    }
    
    if(dis=="pneumonia"){
      
      outcome2<-outcome2[!(is.na(outcome2[,23]) | outcome2[,23]==""), ]  
      outcome2<-outcome2[ order(outcome2[,23],outcome2[,2]), ]
      
      ms<-dim(outcome2)
      
      
      dat1[i,1]=NA
      
      if(num=="best") dat1[i,1]=(outcome2[1,2])
      if(num=="worst") dat1[i,1]=(outcome2[ms[1],2])
      if(class(num)=="numeric" && num<=ms[1]) dat1[i,1]=(outcome2[num,2])
      
      
      
      
      
    }
    
    dat1[i,2]<-st
    
  } 
  
 dat1
  
}
