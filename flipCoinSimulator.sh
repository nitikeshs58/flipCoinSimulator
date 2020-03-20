#!/bin/bash -x

echo "Welcome to Flip coin simulator."
declare -A dictFlip
for (( i=0; i<10; i++ ))
do
	flipCoin=$((RANDOM%2))
	if [[ $flipCoin -eq 0 ]]
	then
		dictFlip[heads]=$((${dictFlip[heads]}+1))
	else
		dictFlip[tails]=$((${dictFlip[tails]}+1))
	fi
done
echo "${!dictFlip[@]} : ${dictFlip[@]}"

headPercentage=$((${dictFlip[heads]}*100/i))
tailPercentage=$((${dictFlip[tails]}*100/i))
