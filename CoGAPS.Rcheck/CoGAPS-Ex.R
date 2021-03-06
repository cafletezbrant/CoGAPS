pkgname <- "CoGAPS"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('CoGAPS')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("GWCoGAPS")
### * GWCoGAPS

flush(stderr()); flush(stdout())

### Name: GWCoGAPS
### Title: GWCoGAPS
### Aliases: GWCoGAPS

### ** Examples

## Not run: 
##D GWCoGAPS(nCores=NA, D, S, nFactor, nSets,saveBySetResults=TRUE, fname=fname,
##D PatternsMatchFN = patternMatch4Parallel,numSnapshots=numSnapshots,minNS=minNS)
## End(Not run)




cleanEx()
nameEx("PatternMatcher")
### * PatternMatcher

flush(stderr()); flush(stdout())

### Name: PatternMatcher
### Title: PatternMatcher Shiny Ap
### Aliases: PatternMatcher

### ** Examples

## Not run: 
##D PBySet <-reOrderBySet(AP)
##D PatternMatcher(PBySet=PBySet,out=NULL,order=NULL, sample.color=NULL)
## End(Not run)





cleanEx()
nameEx("computeGeneGSProb")
### * computeGeneGSProb

flush(stderr()); flush(stdout())

### Name: computeGeneGSProb
### Title: CoGAPS gene membership statistic
### Aliases: computeGeneGSProb geneGSProb
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D #################################################
##D # Results for GIST data in Fertig et al. (2012) #
##D #################################################
##D 
##D # load the data
##D data('GIST_TS_20084')
##D data('TFGSList')
##D 
##D # define transcription factors of interest based on Ochs et al. (2009)
##D TFs <- c("c.Jun", 'NF.kappaB', 'Smad4', "STAT3", "Elk.1", "c.Myc", "E2F.1", 
##D          "AP.1", "CREB", "FOXO", "p53", "Sp1")
##D 
##D # run the GAPS matrix factorization
##D nIter <- 10000
##D results <- CoGAPS(GIST.D, GIST.S, tf2ugFC,
##D                   nFactor=5,
##D                   nEquil=nIter, nSample=nIter,
##D                   plot=FALSE)
##D 
##D # set membership statistics
##D permTFStats <- list()
##D for (tf in TFs) {
##D      genes <- levels(tf2ugFC[,tf])
##D      genes <- genes[2:length(genes)]
##D      permTFStats[[tf]] <- computeGeneTFProb(Amean = GISTResults$Amean, 
##D                                             Asd = GistResults$Asd, genes) 
##D }
##D 
## End(Not run)



cleanEx()
nameEx("createGWCoGAPSSets")
### * createGWCoGAPSSets

flush(stderr()); flush(stdout())

### Name: createGWCoGAPSSets
### Title: createGWCoGAPSSets
### Aliases: createGWCoGAPSSets

### ** Examples

## Not run: 
##D createGWCoGAPSSet(D,nSets=nSets)
## End(Not run)




cleanEx()
nameEx("generateSeeds")
### * generateSeeds

flush(stderr()); flush(stdout())

### Name: generateSeeds
### Title: generateSeeds
### Aliases: generateSeeds

### ** Examples

## Not run: 
##D generateSeeds(chains=2, seed=-1)
## End(Not run)





cleanEx()
nameEx("patternMarkers")
### * patternMarkers

flush(stderr()); flush(stdout())

### Name: patternMarkers
### Title: patternMarkers
### Aliases: patternMarkers

### ** Examples

## Not run: 
##D patternMarkers(Amatrix=AP$Amean,scaledPmatrix=FALSE,Pmatrix=NA,threshold="cut")
## End(Not run)




cleanEx()
nameEx("patternMatch4Parallel")
### * patternMatch4Parallel

flush(stderr()); flush(stdout())

### Name: patternMatch4Parallel
### Title: patternMatch4Parallel
### Aliases: patternMatch4Parallel

### ** Examples

## Not run: 
##D matchedPs<-PatternsMatch4Parallel(Ptot=PBySet,nP=nFactor,nS=nSets,cnt=nFactor,minNS=minNS,bySet=FALSE)
## End(Not run)





cleanEx()
nameEx("plotPatternMarkers")
### * plotPatternMarkers

flush(stderr()); flush(stdout())

### Name: plotPatternMarkers
### Title: plotPatternMarkers
### Aliases: plotPatternMarkers

### ** Examples

## Not run: 
##D plotPatternMarkers(data=p,patternMarkers=PatternMarkers,patternPalette=NA,sampleNames=pd$sample,
##D samplePalette=pd$color,colDenogram=TRUE,heatmapCol="bluered", scale='row')
## End(Not run)



cleanEx()
nameEx("postFixed4Parallel")
### * postFixed4Parallel

flush(stderr()); flush(stdout())

### Name: postFixed4Parallel
### Title: postFixed4Parallel
### Aliases: postFixed4Parallel

### ** Examples

## Not run: 
##D As4fixPs <- postFixed4Parallel(AP.fixed=Fixed,setPs=matchedPs)
## End(Not run)





cleanEx()
nameEx("reOrderBySet")
### * reOrderBySet

flush(stderr()); flush(stdout())

### Name: reOrderBySet
### Title: reOrderBySet
### Aliases: reOrderBySet

### ** Examples

## Not run: 
##D reOrderBySet(AP,nFactor,nSets)
## End(Not run)




### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
