#!/bin/bash

# Script compares the run times for QNX expression with and without negation
reIndex=("1" "2" "3" "4" "5" "6" "7" "8")
#traceNamePrefix=("1" "2" "3") 
#tracelength=("1000" "10000" "100000" "1000000" "10000000")
#pyscript="/home/y2joshi/workspace/TRETraceGenerator/test/traceCreate.py"
#uniqEvents=4
#noOfTraces=1
var=1
dirArg="/home/y2joshi/" 
logFileName=$1
rm $logFileName
touch $logFileName
qnx_data=$3
echo "TRENo,Support,Confidence,TREInstanceCount">>$logFileName
for ((h=0; h<${#reIndex[*]}; h++));
do
#	for j in `seq 1 $2`;
#	do
		sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
		echo "----------------------------------------------------"
		
		R <  /home/y2joshi/Downloads/eclipse/comple/SyntheticExpTRE/rScript_qnx3.r --no-save --args \
		$var $qnx_data ${reIndex[h]} 2>>$logFileName
		var=$((var + 1))
#	done
done