#!/bin/bash -x

#Problem Statement : Flip Coin Simulation
#Discription : This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet
#Author : Kunal Jadhav
#Date : 6 March 2020

function random() {
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
	z=$( random )
	if [[ $z == H ]]
	then
		((singletHeadCount++))
		singlet[H]=$singletHeadCount
	else
		((singletTailCount++))
		singlet[T]=$singletTailCount
	fi
done
