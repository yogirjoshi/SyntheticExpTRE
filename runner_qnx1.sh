#!/bin/bash
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
echo "No,traceLength,alphabetLength,time">>$logFileName
	for j in `seq 1 $2`;
	do
		sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
		echo "----------------------------------------------------"
		
		R <  /home/y2joshi/Downloads/eclipse/comple/SyntheticExpTRE/rScript_qnx1.r --no-save --args \
		$var $qnx_data 1>/dev/null 2>>$logFileName
		var=$((var + 1))
	done
