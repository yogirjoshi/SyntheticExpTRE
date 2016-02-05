#Setup 1
args <- commandArgs(trailingOnly = TRUE)
library(automatonR)
Sys.setenv("PKG_CXXFLAGS"="-std=c++0x")	
Sys.setenv("PKG_LIBS"="-lrt")
traceData = read.csv(file=args[1], header=TRUE, sep=",")
traceEvents = traceData$traceEvents
traceTimes =  traceData$traceTimes
alphabetLength = as.integer(args[4])
tregExType = as.integer(args[2])
if(tregExDim == 1){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+>[0,2000])")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0>[0,2000])")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0*>[0,2000])")
}
if(tregExDim == 2){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1>[0,2000])")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1>[0,2000])")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1+>[0,2000])")
}
if(tregExDim == 3){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1.2>[0,2000])")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1.2>[0,2000])")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1+.2>[0,2000])")
}
if(tregExDim == 4){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1.2.3>[0,2000])")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1.2.3>[0,2000])")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1+.2.3>[0,2000])")
}
if(tregExDim == 5){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1.2.3.4>[0,2000])")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1.2.3.4>[0,2000])")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1+.2.3.4>[0,2000])")
}
totalTime=r1$time + r2$time + r3$time
write(paste(args[3],tregExDim,length(traceEvents),totalTime,sep = ","), stderr())
