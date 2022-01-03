#! /bin/bash


# Hello my name is Danial Bayati.
# I'm student of Shahrood university of Tecnology with 9816073 student ID.
# This script can analyze apache logs, access logs and error logs.


sudo apt install figlet
clear
figlet Apache Analyzer

printf "\n*********************************************\n\n"

function input {
	printf "please choose file that you want be Analyze:\n"
	printf "1- apache.log\n"
	printf "2- access.log\n"
	printf "3- error.log\n"
	printf "press any key except 1,2,3 to exit\n"
	read num

	case $num in
		1) file="apache.log"
		clear
		figlet Analyze apache.log
		menu;;
		2) file="access.log"
		clear
		iglet Analyze access.log
		menu;;
		3) file="error.log"
		clear
		figlet Analyze error.log
		menu;;
	esac
}

function menu {
	printf "\n**********************************************\n\n"
	printf "choose option"
}

input