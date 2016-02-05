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
tregExClass = as.integer(args[3])
if(tregExClass == 1){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0)*).((<0.^(1)*.1>[0,3000]).(^(0)*))+")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0+.^(0|1)*.1.^(0|1)*>[0,3000]))+")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(0|1)*.1+.^(0)*>[0,3000]))+")
	r4 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0+.^(1)*.1+.^(0|1)*>[0,3000]))+")
}
if(tregExClass == 2){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1>[0,3000])+",tregExClass)
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1>[0,3000])+",tregExClass)
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1+>[0,3000])+",tregExClass)
	r4 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1+>[0,3000])+",tregExClass)
}

totalTime=r1$time + r2$time + r3$time + r4$time
write(paste(args[1],length(traceEvents),alphabetLength,tregExClass,totalTime,sep = ","), stderr())
