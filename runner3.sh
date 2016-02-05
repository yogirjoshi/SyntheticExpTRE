#!/bin/bash
dimLength=("1" "2" "3" "4" "5")
pyscript="/home/y2joshi/workspace/TRETraceGenerator/test/traceCreate.py"
tracelength=10000
uniqEvents=10
noOfTraces=1
var=1
dirArg="/home/y2joshi/" 
logFileName=$1
rm $logFileName
touch $logFileName
echo "No,dimLength,traceLength,time">>$logFileName
for ((i=0; i<${#dimLength[*]}; i++));
do
	python $pyscript $tracelength $uniqEvents $noOfTraces $dirArg"S1"${dimLength[i]}"/"
	for j in `seq 1 $2`;
	do
		sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
		echo "----------------------------------------------------"
		echo "Dimlength:" ${dimLength[i]} 
		R <  /home/y2joshi/Downloads/eclipse/comple/SyntheticExpTRE/rScript3.r --no-save --args \
$dirArg"S1"${dimLength[i]}"/trace0" ${dimLength[i]} $var $uniqEvents 1>/dev/null 2>>$logFileName
		var=$((var + 1))
	done
done	