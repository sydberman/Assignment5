#PART 2
#download the SARS-CoV-2 reference genome from Genbank. Use the accession NC_045512.2
#The Spike glucoprotein  (aka S protein) plays an important role in infection, and therefore it determines the virulence of the strain and it's a target for vaccines and other therapeutic drugs.
library(sangerseqR)

cov<-scan("./sequence.gb",what="character",sep="\n") #import file into R as object 
print(cov) #verify object is correct

Seq<-gsub(".*1 *([gatc])","\\1",paste(cov)) #delete everythign before the DNA sequence 
paste(Seq,collapse=" ") #collapse into one string

Seq<-gsub(".*ORIGIN +","",paste(Seq,collapse="")) #eliminate text before sequence 
Seq<-gsub(" |//","",Seq) #eliminate space and // at end 
nchar(Seq) #counts the number of nucleotides 

#The S protein starts at bp position 21,563 and ends at position 25,384
S<-substr(Seq,21563,25384) #isolates the nucleotides between the 2 base pair positions 
nchar(S) #verify all the nucleotides were captured

#After running the sequence for the S protein in blast I believe this gene is highly conserved. There were 100 sequences with significant 
#alignments with zero evalue meaning there is no background noise in these hits. Most had 100% percent identity with the 
#furthest variant still having 99.92% conserved. The graphic also showed alignment scores all >=200. 
