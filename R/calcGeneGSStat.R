# calcGeneGSStat: calculate probability gene belongs in gene set
# History: v1.0 EJF original CoGAPS

# Inputs: Amean - A matrix mean values
#         Asd - A matrix standard deviations
#         GStoGenes - data.frame or list with gene sets
#         numPerm - number of permutations for null
#         Pw - weighting on genes
#         nullGenes - adjust genes

# Output: environment with gene set statistics
#       NOTE: should make into list object, env historical

#'\code{calcGeneGSStat} calculates the probability that a gene
#'listed in a gene set behaves like other genes in the set within
#'the given data set
#'
#'@param Amean A matrix mean values
#'@param Asd A matrix standard deviations
#'@param GSGenes data.frame or list with gene sets
#'@param numPerm number of permutations for null
#'@param Pw weight on genes
#'@param nullGenes - logical indicating gene adjustment
#'@export

calcGeneGSStat  <- function(Amean, Asd, GSGenes, numPerm, Pw=rep(1,ncol(Amean)), nullGenes=F) {
    gsStat <- calcCoGAPSStat(Amean, Asd, data.frame(GSGenes),
                             numPerm=numPerm)
    gsStat <- gsStat$GSUpreg

    gsStat <- -log(gsStat)

  if (!all(is.na(Pw))) {
    if (length(Pw) != length(gsStat)) {
      stop('Invalid weighting')
    }
    gsStat <- gsStat*Pw
  }

    if (nullGenes) {
        ZD <- Amean[setdiff(row.names(Amean), GSGenes),] /
         Asd[setdiff(row.names(Amean), GSGenes),]
    } else {
        ZD <- Amean[GSGenes,]/Asd[GSGenes,]
    }
    outStats <- apply(sweep(ZD,2,gsStat,FUN="*"),1,sum) / (sum(gsStat))

    outStats <- outStats / apply(ZD,1,sum)

    outStats[which(apply(ZD,1,sum) < .Machine$double.eps)] <- 0.


    if (sum(gsStat) < .Machine$double.eps) {
        return(0.)
    }

    return(outStats)

}


computeGeneGSProb <- function(Amean, Asd, GSGenes, Pw=rep(1,ncol(Amean)),
                              numPerm=500, PwNull=F) {
    geneGSStat <- calcGeneGSStat(Amean=Amean, Asd=Asd, Pw=Pw,
                                 GSGenes=GSGenes, numPerm=numPerm)



    if (PwNull) {
      permGSStat <- calcGeneGSStat(Amean=Amean, Asd=Asd,
                                  GSGenes=GSGenes, numPerm=numPerm, Pw=Pw,
                                  nullGenes=T)
    } else {
      permGSStat <- calcGeneGSStat(Amean=Amean, Asd=Asd,
                                  GSGenes=GSGenes, numPerm=numPerm,
                                  nullGenes=T)
    }

    finalStats <- sapply(GSGenes,
                         function(x) length(which(permGSStat > geneGSStat[x])) / length(permGSStat))

    return(finalStats)


}
