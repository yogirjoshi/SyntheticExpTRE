#!/bin/bash
uniqEvents=("5" "15" "25" "35" "45")
pyscript="/home/y2joshi/workspace/TRETraceGenerator/test/traceCreate.py"
tracelength=10000
noOfTraces=1
var=1
dirArg="/home/y2joshi/" 
logFileName=$1
rm $logFileName
touch $logFileName
echo "No,alphabetLength,traceLength,time">>$logFileName
for ((i=0; i<${#uniqEvents[*]}; i++));
do
python $pyscript $tracelength ${uniqEvents[i]} $noOfTraces $dirArg"S1"${uniqEvents[i]}"/"
	for j in `seq 1 $2`;
	do
		sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
		echo "----------------------------------------------------"
		echo "UniqEvents:" ${uniqEvents[i]} 
		R <  /home/y2joshi/Downloads/eclipse/comple/SyntheticExpTRE/rScript2.r --no-save --args \
		 $dirArg"S1"${uniqEvents[i]}"/trace0" ${uniqEvents[i]} $var 1>/dev/null 2>>$logFileName
		var=$((var + 1))
	done
done	