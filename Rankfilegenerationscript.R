
x<-read.csv("commongenesWT_HOMxWT_HET.csv",sep=",",header=T, fill = T, encoding="UTF-8")

#don't bother runnign attach - Antoine
#attach(x)

head(x)

#"x$fcSign=sign(logFC)" generates a new column that is the sign of fold change. 

x$fcSign=sign(x$logFC)

#"x$logP=-log10(PValue)" generates a new column that is the negative log10 of the p-value.
head(x)

x$logP =-log10(x$P.Value)

#"x$metric=logP/fcSign" generates a new column that is the metric score that we'll use for ranking and pathway analysis

head(x)

x$metric=x$logP/x$fcSign

#"y<-x[,c("Name", "metric")]" makes a new table called "y" that consists only of gene names and metric scores. 
head(x)


y<-x[,c("ENSEMBL", "metric")]

#Write.table command outputs the gene name and rank metric data to a new file called "expression.rnk" gene


write.table(y,file="SERT Rat RNASeq analysis (WT vs HOM).rnk",quote=F,sep="\t",row.names=F)


###Updated commands

##Settin up the working directory

setwd("~/R_RNAseq_workingdirectory")

print(y)

read.table

##Edited code for the WT vs HET dataset to stratify genes 

x<-read.csv("SERT Rat RNASeq analysis Clean WT vs HET.csv",sep=",",header=T, encoding="UTF-8", fill = T, )

head(x)

x$fcSign=sign(x$logFC)
x$logP =-log10(x$Pvalue)
x$metric=x$logP/x$fcSign
y<-x[,c("Name", "metric")]
write.table(y,file="expression2.rnk",quote=F,sep="\t",row.names=F)





#6.3.19 Updated programme to take in data direct from Miles' tools.

x<-read.csv("SERT Rat RNASeq analysis (Clean vs MDMA).csv",sep=",",header=T, fill = T, encoding="UTF-8")

x$fcSign=sign(x$logFC)

x$logP =-log10(x$P.Value)

x$metric=x$logP/x$fcSign

y<-x[,c("ENSEMBL", "metric")]

write.table(y,file="SERT Rat RNASeq analysis (Clean vs MDMA).rnk",quote=F,sep="\t",row.names=F)


