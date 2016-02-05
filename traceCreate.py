'''
Created on Jan 25, 2016

@author: y2joshi
'''
import sys, os
import time
from Crypto.Random.random import randrange

if __name__ == '__main__':
    traceLength = int(sys.argv[1])
    uniqueEvents = int(sys.argv[2])
    noOfTraces = int(sys.argv[3])
    traceDir = sys.argv[4]
    for i in range(0,noOfTraces):
        try:
            if not os.path.isdir(traceDir):
                os.makedirs(traceDir)
            outFile = open(traceDir + "/trace" + str(i),"w")
            outFile.write("traceTimes,traceEvents\n")
            for j in range(0,traceLength):
                evt = randrange(1,uniqueEvents+1,1)
                tm= time.time()
                outFile.write(str(tm)+","+str(evt)+"\n")
                #time.sleep(0.0005)
        finally:
            outFile.close()    
        