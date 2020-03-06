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
random
