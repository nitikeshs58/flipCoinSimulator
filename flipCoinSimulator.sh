#!/bin/bash -x

echo "Welcome to Flip coin simulator."
declare -A dictSinglet
read -p "Enter Singlet flip value: " singletFlips
for (( i=0; i<$singletFlips; i++ ))
do
	coinside=""
	randomSinglet=$((RANDOM%2))
	if [[ $randomSinglet -eq 0 ]]
	then
		dictSinglet[H]=$((${dictSinglet[H]}+1))
	else
		dictSinglet[T]=$((${dictSinglet[T]}+1))
	fi
done
echo "SingletKey :${!dictSinglet[@]} : SingletValue:${dictSinglet[@]}"
headPercentage=$((${dictSinglet[H]}*100/i))
tailPercentage=$((${dictSinglet[T]}*100/i))


declare -A dictDoublet
declare -A arrDoublet
function percentage()
{
	local v=$1
	coinPercent=$((${dictDoublet[$v]}*100/$doubletFlips))
	arrDoublet[$v]=$coinPercent
}

function flipSimulator()
{
	for (( i=1; i<=$1; i++ ))
	do
		coinFlip=""
		for (( j=1; j<=$2; j++ ))
		do
			randomCoin=$((RANDOM%2))
			if [[ $randomCoin -eq 0 ]]
			then
				coinFlip+="H"
			else
				coinFlip+="T"
			fi
		done
		dictDoublet[$coinFlip]=$((${dictDoublet[$coinFlip]}+1))
		percentage $coinFlip
	done
}

echo "Doublet :"
DOUBLET=2
read -p "Enter  flips for doublet: " doubletFlips
flipSimulator $doubletFlips $DOUBLET
echo "Key :${!dictDoublet[@]} Value:${dictDoublet[@]}"
echo "Key:${!arrDoublet[@]}  Percentage: ${arrDoublet[@]}"
