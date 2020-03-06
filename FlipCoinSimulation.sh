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

function doubletRandom() {
	state=$((RANDOM%4))
	if [[ $state -eq  1 ]]
	then
		echo "HH"
	elif [[ $state -eq 2 ]]
	then
		echo "TT"
	elif [[ $state -eq 3 ]]
	then
		echo "HT"
	else
		echo "TH"
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
   z=$( doubletRandom )
   if [[ $z == HH ]]
   then
      ((doubletHeadCount++))
      doublet[HH]=$doubletHeadCount
	elif [[ $z == TT ]]
	then
		((doubletTailCount++))
		doublet[TT]=$doubletTailCount
	elif [[ $z == HT ]]
	then
		((HeadThenTail++))
		doublet[HT]=$HeadThenTail
	elif [[ $z == TH ]]
	then
      ((TailThenHead++))
      doublet[TH]=$TailThenHead
   fi
done

