#!/bin/bash -x

declare -A dict
i=1
while (( $i <= 12 ))
do
	dict[$i]=0
	#echo ${dict[$i]}
	((i++))
done

j=1
while (( $j <= 50 ))
do
	key=$[(RANDOM%12)+1]
	value=${dict[$key]}
	((value++))
	#unset dict[$key]
	dict[$key]=$value
	((j++))
done

for key in ${!dict[@]}
do
	echo $key "-" ${dict[$key]}
done

echo ${dict[@]}
