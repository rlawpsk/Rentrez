library(rentrez)
library(dplyr)

# creates an object named ncbi_ids that concatenates the strings HQ433692.1","HQ433694.1","HQ433691.1

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

# receive data files in a variety of formats from the NCBI database. 
# This specific data base is named nuccore and data is given in the "fasta" format

Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

Sequence <- strsplit(Bburg,"\n\n")

Sequences <- unlist(Sequence)
header <- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences <- data.frame(Name=header,Sequence=seq)


