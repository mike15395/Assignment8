#!/bin/bash 
#declare -A dictionary
dict_counter=0

for ((i=1;i<=10;i++))
do

	dictionary[dict_counter++]=$[(RANDOM%6)+1]

done

echo ${dictionary[@]} | awk 'BEGIN{RS=" ";} {print $1}' | sort -n

max=0
element=0
min=10
element_min=0

for ((i=0;i<${#dictionary[@]};i++))
do
	count=1
	for ((j=$[(i+1)];j<${#dictionary[@]};j++))
	do
		if ((dictionary[$i]==dictionary[$j]))
		then
			((count++))
		fi
	done

	if (($max<$count))
	then
		max=$count
		element=${dictionary[$i]}
	fi

	if (($min > $count))
	then
		min=$count
		element_min=${dictionary[$i]}
	fi

done

echo  $element "repeating" $max "times" 
echo $element_min "repeating" $min "times"
