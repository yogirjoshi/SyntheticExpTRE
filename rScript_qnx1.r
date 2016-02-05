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
r1 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0)*).((<0.^(1)*.1>[0,2000]).(^(0)*))+")
r2 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(0|1)*.1.^(0|1)*>[0,2000]))+")
r3 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(0|1)*.1.^(0)*>[0,2000]))+")
r4 = processTrace(traceTimes, traceEvents, alphabetLength, "(^(0|1)*).((<0.^(1)*.1.^(0|1)*>[0,2000]))+")
totalTime=r1$time + r2$time + r3$time + r4$time
write(paste(args[1],length(traceEvents),alphabetLength, totalTime,sep = ","), stderr())
