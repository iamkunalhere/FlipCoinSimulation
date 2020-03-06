#!/bin/bash -x

#Problem Statement : Flip Coin Simulation
#Discription : This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet
#Author : Kunal Jadhav
#Date : 6 March 2020

function singletRandom() {
	state=$((RANDOM%2))
	if [[ $state -eq 1 ]]
	then
		echo "H"
	else
		echo "T"
	fi
}

function percentage() {
	temp=$1
	percent=$(($temp*100/10))
	echo "$percent%"
}

declare -A singlet

singlet=( ["H"]=0 ["T"]=0)
singletHeadCount=0
singletTailCount=0
for ((i=0; i<10; i++))
do
	z=$( singletRandom )
	if [[ $z == H ]]
	  then
		((singletHeadCount++))
		singlet[H]=$singletHeadCount
	  else
		((singletTailCount++))
		singlet[T]=$singletTailCount
	fi
done

declare -A doublet

doublet=( ["HH"]=0 ["TT"]=0 ["HT"]=0 ["TH"]=0)
HeadThenTail=0
TailThenHead=0
doubletHeadCount=0
doubletTailCount=0
for ((j=0; j<10; j++))
do
	y=$( singletRandom )
   z=$( singletRandom )
	res=$y$z
   if [[ $res == HH ]]
   then
      ((doubletHeadCount++))
      doublet[HH]=$doubletHeadCount
	elif [[ $res == TT ]]
	then
		((doubletTailCount++))
		doublet[TT]=$doubletTailCount
	elif [[ $res == HT ]]
	then
		((HeadThenTail++))
		doublet[HT]=$HeadThenTail
	elif [[ $res == TH ]]
	then
      ((TailThenHead++))
      doublet[TH]=$TailThenHead
   fi
done

declare -A triplet

triplet=( ["HHH"]=0 ["TTT"]=0 ["HHT"]=0 ["HTH"]=0 ["THH"]=0 ["THT"]=0 ["TTH"]=0 ["HTT"]=0)
tripletHeadCount=0
tripletTailCount=0
HeadHeadTail=0
HeadTailHead=0
TailHeadHead=0
TailHeadTail=0
TailTailHead=0
HeadTailTail=0
for ((k=0; k<10; k++))
do
	x=$( singletRandom )
	y=$( singletRandom )
	z=$( singletRandom )
	res=$x$y$z

   if [[ $res == HHH ]]
   then
      ((tripletHeadCount++))
      triplet[HHH]=$tripletHeadCount
   elif [[ $res == TTT ]]
   then
      ((tripletTailCount++))
      triplet[TTT]=$tripletTailCount
   elif [[ $res == HHT ]]
   then
      ((HeadHeadTail++))
      triplet[HHT]=$HeadHeadTail
   elif [[ $res == HTH ]]
   then
      ((HeadTailHead++))
      triplet[HTH]=$HeadTailHead
   elif [[ $res == THH ]]
	then
		((TailHeadHead++))
		triplet[THH]=$TailHeadHead
	elif [[ $res == THT ]]
	then
		((TailHeadTail++))
		triplet[THT]=$TailHeadTail
	elif [[ $res == TTH ]]
	then
		((TailTailHead++))
		triplet[TTH]=$TailTailHead
	elif [[ $res == HTT ]]
	then
		((HeadTailTail++))
		triplet=$HeadTailTail
	fi
done

