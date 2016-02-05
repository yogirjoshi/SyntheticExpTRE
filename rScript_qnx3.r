#Setup 1
args <- commandArgs(trailingOnly = TRUE)
print(args)
library(automatonR)
Sys.setenv("PKG_CXXFLAGS"="-std=c++0x")	
Sys.setenv("PKG_LIBS"="-lrt")
traceData = read.csv(file=args[2], header=TRUE, sep=",")
traceEvents = traceData$traceEvents
traceTimes = traceData$traceTimes
alphabetLength = max(traceEvents)
tregExInd = as.integer(args[3])
if(tregExInd == 1){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0)*).((<0.^(1)*.1>[0,3000]).(^(0)*))+")
}	
if(tregExInd == 2){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(0|1)*.1>[0,3000]).^(0|1)*)+")
}	
if(tregExInd == 3){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(0|1)*.1>[0,3000]).^(0)*)+")
}
if(tregExInd == 4){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(1)*.1>[0,3000]).^(0|1)*)+")
}
if(tregExInd == 5){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0)*).((<0.^(1)*.1>[0,3000]).^(0|1)*)+")
}	
if(tregExInd == 6){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(1)*.1.^(0)*>[0,3000]))+")
}	
if(tregExInd == 7){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0)*).((<0.^(0|1)*.1>[0,3000]).^(0)*)+")
}
if(tregExInd == 8){
	r = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0)*).((<0.^(1)*.1>[0,3000]).^(0|1)*)+")
}
maxSupport = max(r$success[!is.na(r$success)])
confs = c(1, 0.9, 0.8, 0.7, 0.6)
while(maxSupport >= 1){
	for(conf in confs){
		res = getMinedSpecifications(r,conf,maxSupport)	
		write(paste(tregExInd,maxSupport, conf,res$treInstanceCount, sep = ","), stderr())
	}
	maxSupport = maxSupport / 2
}

