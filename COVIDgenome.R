#PART 2
#Using what you have learned, make a new script called COVIDgenome.R that will 
#download the SARS-CoV-2 reference genome from Genbank. Use the accession NC_045512.2
#The Spike glucoprotein  (aka S protein) plays an important role in infection, and therefore it determines the virulence of the strain and it's a target for vaccines and other therapeutic drugs.
library(sangerseqR)

seq<-scan("sequence.gb",what="character",sep="\n")

?scan
print(seq)

Seq<-gsub(".*1*([gatc]) ","\\1", paste(seq)) #delete everythign before the DNA sequence 
print(Seq)
paste(Seq,collapse=" ")
Seq<-gsub(".*ORIGIN +","",paste(Seq,collapse="")) #eliminate text before sequence 
Seq
Seq<-gsub(" |//","",Seq) #eliminate space and // at end 
Seq

#The S protein starts at bp position 21,563 and ends at position 25,384
#Use regular expressions in R to isolate the S protein from the genome you downloaded
grepl( , Seq)
gregexcpr({[21563],[25384]},Seq)
?sapply
?regexpr

nchar(Seq)

substr(Seq,21563,25384)

#this gene is highly conserved at only 99%

#Open a BLAST search in your web browser. Manually paste in the sequence and run the BLAST search with default parameters.
#It may take a few minutes for the search to run. After it's finished, look at the tabs Descriptions, Graphic Summary, and Alignments.
#Would you say this gene is highly conserved or evolving rapidly? Why?  Explain this in a comment at the end of your second script.