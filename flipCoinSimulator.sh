#!/bin/bash -x

echo "Welcome to Flip coin simulator."
flipCoin=$((RANDOM%2))
if [[ $flipCoin -eq 0 ]]
then
	echo "Heads"
else
	echo "Tails"
fi
