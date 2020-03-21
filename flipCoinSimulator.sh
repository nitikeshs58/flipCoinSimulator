#!/bin/bash -x
declare -A coinDict1
declare -A coinDict2
declare -A coinDict3
declare -A coinArray1
declare -A coinArray2
declare -A coinArray3

function percentage1()
{
   local v=$1
   coinPercent1=$((${coinDict1[$v]}*100/$no_of_flips))
   coinArray1[$v]=$coinPercent1
}

function percentage2()
{
   local v=$1
   coinPercent2=$((${coinDict2[$v]}*100/$no_of_flips))
   coinArray2[$v]=$coinPercent2
}

function percentage3()
{
   local v=$1
   coinPercent3=$((${coinDict3[$v]}*100/$no_of_flips))
   coinArray3[$v]=$coinPercent3
}

function flipSimulator()
{
   local coins=$1
   local flips=$2
   for (( i=1; i<=$flips; i++ ))
   do
      coinFlip=""
      for (( j=1; j<=$coins; j++ ))
      do
         randomCoin=$((RANDOM%2+1))
         if [[ $randomCoin -eq 1 ]]
         then
				coinFlip+="H"
         elif [[ $randomCoin -eq 2 ]]
			then
            coinFlip+="T"
         fi
      done

      if [[ $coins -eq $SINGLET ]]
      then
         coinDict1[$coinFlip]=$((${coinDict1[$coinFlip]}+1))
         percentage1 $coinFlip
      elif [[ $coins -eq $DOUBLET ]]
      then
         coinDict2[$coinFlip]=$((${coinDict2[$coinFlip]}+1))
         percentage2 $coinFlip
      else
         coinDict3[$coinFlip]=$((${coinDict3[$coinFlip]}+1))
         percentage3 $coinFlip
      fi
   done
}

echo "Singlet flip coin"
read -p "Number of flips: " no_of_flips
SINGLET=1
flipSimulator $SINGLET $no_of_flips

echo "Key: ${!coinDict1[@]}   Value: ${coinDict1[@]}"
echo "Key: ${!coinArray1[@]}  Percent: ${coinArray1[@]}"

echo "Doublet flip coin "
read -p "Number of flips: " no_of_flipsx
DOUBLET=2
flipSimulator $DOUBLET $no_of_flips

echo "Key: ${!coinDict2[@]}   Value: ${coinDict2[@]}"
echo "Key: ${!coinArray2[@]}  Percent: ${coinArray2[@]}"

echo "Triplet flip coin"
read -p "Number of Flips: " no_of_flips
TRIPLET=3
flipSimulator $TRIPLET $no_of_flips

echo "Key: ${!coinDict3[@]}   Value: ${coinDict3[@]}"
echo "Key: ${!coinArray3[@]}  Percent: ${coinArray3[@]}"
