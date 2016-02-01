#!/bin/bash
tracelength=("10000" "30000" "50000" "70000" "90000")
pyscript="/home/y2joshi/workspace/TRETraceGenerator/test/traceCreate.py"
uniqEvents=4
noOfTraces=1
var=1
dirArg="/home/y2joshi/" 
logFileName=$1
rm $logFileName
touch $logFileName
echo "No,traceLength, alphabetLength, time(milliseconds)">>$logFileName
for ((i=0; i<${#tracelength[*]}; i++));
do
	python $pyscript ${tracelength[i]} $uniqEvents $noOfTraces $dirArg"S1"${tracelength[i]}"/"
	for j in `seq 1 $2`;
	do
		sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
		echo "----------------------------------------------------"
		echo "Tracelength:" ${tracelength[i]} 
		R <  /home/y2joshi/Downloads/eclipse/comple/SyntheticExpTRE/rScript1.r --no-save --args \
		$dirArg"S1"${tracelength[i]}"/trace0" $uniqEvents $var 1>/dev/null 2>>$logFileName
		var=$((var + 1))
	done
done	