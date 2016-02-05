#Setup 1
args <- commandArgs(trailingOnly = TRUE)
library(automatonR)
Sys.setenv("PKG_CXXFLAGS"="-std=c++0x")	
Sys.setenv("PKG_LIBS"="-lrt")
traceData = read.csv(file=args[1], header=TRUE, sep=",")
traceEvents = traceData$traceEvents
traceTimes =  traceData$traceTimes
alphabetLength = as.integer(args[4])
tregExClass = as.integer(args[2])
if(tregExClass == 1){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.^(1)*.1.^(2)*.2>[1,5000])")
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1.^(2)*.2>[1,5000])")
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.^(1)*.1.2>[1,5000])")
	r4 = processTrace(traceTimes, traceEvents, alphabetLength, "(<^(0)*.0.1.2>[1,5000])")
}
if(tregExClass == 2){
	r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1.2> [1,5000])",tregExClass)
	r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0+.1.2>[1,5000])",tregExClass)
	r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1+.2>[1,5000])",tregExClass)
	r4 = processTrace(traceTimes, traceEvents, alphabetLength, "(<0.1.2+>[1,5000])",tregExClass)
}
totalTime=r1$time + r2$time + r3$time + r4$time
write(paste(args[3],tregExClass,length(traceEvents),totalTime,sep = ","), stderr())
