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
	printf "*- exit\n"
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
		*) exit;;
	esac
}

function menu {

	printf "\n***************************************************\n"
	printf "*              choose option below                *\n"
	printf "***************************************************\n"
	printf "*  1- All IPs           |  2- test                *\n"
	printf "***************************************************\n"
	printf "*  3- All IPs           |  4- test                *\n"
	printf "***************************************************\n"
	printf "*  5- All IPs           |  6- test                *\n"
	printf "***************************************************\n"
	printf "*  7- All IPs           |  8- test                *\n"
	printf "***************************************************\n"
	printf "*  9- All IPs           | 10- test                *\n"
	printf "***************************************************\n"
	printf "* 11- All IPs           | 12- test                *\n"
	printf "***************************************************\n"

	read option
	clear

	case $option in
		1) test ;;
		2) test ;;
		3) test ;;
		4) test ;;
		5) test ;;
		6) test ;;
		7) test ;;
		8) test ;;
		9) test ;;
		10) test ;;
		11) test ;;
		12) test ;;
	esac

}

function test {
	echo "test"
}

input