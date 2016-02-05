#!/bin/bash
reClass=("2")
pyscript="/home/y2joshi/workspace/TRETraceGenerator/test/traceCreate.py"
tracelength=50000
uniqEvents=30
noOfTraces=1
var=1
dirArg="/home/y2joshi/" 
logFileName=$1
rm $logFileName
touch $logFileName
echo "No,reClass,traceLength,time">>$logFileName
for ((i=0; i<${#reClass[*]}; i++));
do
	python $pyscript $tracelength $uniqEvents $noOfTraces $dirArg"S1"${reClass[i]}"/"
	for j in `seq 1 $2`;
	do
		sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
		echo "----------------------------------------------------"
		echo "ReClass:" ${reClass[i]} 
		R <  /home/y2joshi/Downloads/eclipse/comple/SyntheticExpTRE/rScript4.r --no-save --args \
$dirArg"S1"${reClass[i]}"/trace0" ${reClass[i]} $var $uniqEvents 1>/dev/null 2>>$logFileName
		var=$((var + 1))
	done
done	