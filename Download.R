# linkt to git repository: https://github.com/sydberman/Assignment5.git

#Assignment 5
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creates list of 3 sequences names 
library(rentrez)  #ensures package is ready for use 
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #entrez_fetch-retrieves data from NCBI databases that matches set of critera: 
#db - name of database to use, id to search for, rettype-format to get data 

Sequences<-strsplit(Bburg, "\n\n") #splits into substrings based on > 
print(Sequences) #verify string was split correctly 

Sequences<-unlist(Sequences) #converts list into a data frame

#using regex to separate the sequences from the headers
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) #header 
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences) #sequences
Sequences<-data.frame(Name=header,Sequence=seq) #converts new objects into a data frame 

s<-gsub("[\\n\n]", "", seq) #removing newline from the seq rows 
print(s) #verifying it works 

Sequences<-data.frame(Name=header,Sequence=s) #creating a data frame 

#Output this data frame to a file called Sequences.csv
write.csv(Sequences,"Sequences.csv")

