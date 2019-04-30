
# Comparison programme

WT_HOM <- read.csv("SERT Rat RNASeq analysis (WT vs HOM).csv")
WT_HET <- read.csv("SERT Rat RNASeq analysis (WT vs HET).csv")
HET_HOM <- read.csv("SERT Rat RNASeq analysis (HET vs HOM).csv")
#intersect <- C1[na.omit(match(C2$ENSEMBL,C1$ENSEMBL,C3$ENSEMBL)),c(1,2)]

WT_HOMxWT_HET <- WT_HOM[na.omit(match(WT_HET$ENSEMBL,WT_HOM$ENSEMBL)),]
nrow(WT_HOMxWT_HET)

WT_HOMxHET_HOM <- WT_HET[na.omit(match(WT_HET$ENSEMBL,HET_HOM$ENSEMBL)),]
nrow(WT_HOMxHET_HOM)

WT_HETxHET_HOM <- HET_HOM[na.omit(match(WT_HOM$ENSEMBL,HET_HOM$ENSEMBL)),]
nrow(WT_HETxHET_HOM)

#Generating the triple interactions match

WT_HOMxWT_HETvsWT_HOMxHET_HOM <- WT_HOMxWT_HET[na.omit(match(WT_HOMxHET_HOM$ENSEMBL,WT_HOMxWT_HET$ENSEMBL)),]
x <- WT_HOMxWT_HETvsWT_HOMxHET_HOM
WT_HETxHET_HOMvsx <- x[na.omit(match(WT_HETxHET_HOM$ENSEMBL,x$ENSEMBL)),]
similar3 <- WT_HETxHET_HOMvsx
nrow(similar3)
print(similar3)
print(WT_HOMxWT_HET)
write.csv(WT_HOMxWT_HET,"commongenesWT_HOMxWT_HET.csv")
write.csv(similar3,"commongenesWT_HOMxWT_HETxHET_HOM.csv")


#C1_C3 <- C1[na.omit(match(C2$ENSEMBL,C3$ENSEMBL)),]



# analysis and generation of venn diagram

library(VennDiagram)

WTvsHET_area1 <- nrow(WT_HET)
WTvsHOM_area2 <- nrow(WT_HOM)
HETvsHOM_area3 <- nrow(HET_HOM)
Sim1_n12 <- nrow(WT_HOMxWT_HET) 
Sim2_n13 <- nrow(WT_HETxHET_HOM) 
Sim3_n23 <- nrow(WT_HOMxHET_HOM)
All3_n123 <- nrow(similar3)

print(WTvsHOM_area2)


#protec

# WTvsHET_area1 <- nrow(WT_HET) - nrow(WT_HOMxWT_HET) - nrow(WT_HETxHET_HOM) + nrow(similar3)
# WTvsHOM_area2 <- nrow(WT_HOM) - nrow(WT_HOMxWT_HET) - nrow(WT_HOMxHET_HOM) + nrow(similar3)
# HETvsHOM_area3 <- nrow(HET_HOM) - nrow(WT_HOMxHET_HOM) - nrow(WT_HETxHET_HOM) + nrow(similar3)
# Sim1_n12 <- nrow(WT_HOMxWT_HET) - nrow(similar3)
# Sim2_n13 <- nrow(WT_HETxHET_HOM) - nrow(similar3)
# Sim3_n23 <- nrow(WT_HOMxHET_HOM) - nrow(similar3)
# All3_n123 <- nrow(similar3)

class(WTvsHOM)


#DEG_similar <- nrow(intersect)

# grid.newpage()
# draw.triple.venn(area1 = WTvsHET, area2 = DEG_WTvsHOM, area3 = DEG_HETvsHOM, cross.area = DEG_similar, 
#                    category = c("Wildtype vs Heterozygous","Wildtype vs Homozygous", "Heterozygous vs Homozygous"), lty = rep("blank",2),
#                    fill = c("light blue", "pink"), alpha = rep(0.5,2), cat.pos = c(0,0), cat.dist = rep(0.025,2))



grid.newpage()

draw.triple.venn(area1 = WTvsHET_area1, area2 = WTvsHOM_area2, area3 = HETvsHOM_area3, n12 = Sim1_n12, n23 = Sim3_n23, n13 = Sim2_n13, 
                 n123 = All3_n123, category =  c("Wildtype vs Heterozygous","Wildtype vs Homozygous", "Heterozygous vs Homozygous"), lty = "blank", 
                 fill = c("blue", "pink", "red"))




grid.newpage()
venn.plot <- draw.triple.venn(area1           = WTvsHET_area1,
                              area2           = WTvsHOM_area2,
                              area3           = HETvsHOM_area3,
                              n12             = Sim1_n12,
                              n23             = Sim3_n23,
                              n13             = Sim2_n13,
                              n123            = All3_n123,
                              category        = c('A', 'B', 'C'),
                              fill            = c('red', 'blue', 'green'),
                              cat.col         = c('red', 'blue', 'green'),
                              cex             = c(1/2,2/2,3/2,4/2,5/2,6/2,7/2),
                              cat.cex         = c(1,2,3),
                              euler           = TRUE,
                              scaled          = FALSE
)



grid.newpage()
venn.plot <- draw.triple.venn(area1           = 1,
                              area2           = 3,
                              area3           = 4,
                              n12             = 2,
                              n23             = 2,
                              n13             = 2,
                              n123            = 1,
                              category        = c('A', 'B', 'C'),
                              fill            = c('red', 'blue', 'green'),
                              cat.col         = c('red', 'blue', 'green'),
                              cex             = c(1/2,2/2,3/2,4/2,5/2,6/2,7/2),
                              cat.cex         = c(1,2,3),
                              euler           = TRUE,
                              scaled          = FALSE
)



class(intersect)

write.csv(intersect,"commongenes.csv")



