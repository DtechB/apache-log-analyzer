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
		*) exit;;
	esac
}

function menu {

	printf "\n**********************************************************\n"
	printf "*                   choose option below                    *\n"
	printf "************************************************************\n"
	printf "*  1- all IPs                |  2- number of visit per IPs *\n"
	printf "************************************************************\n"
	printf "*  3- top 10 IPs & referrs   |  4- request per day         *\n"
	printf "************************************************************\n"
	printf "*  5- All IPs                |  6- test                    *\n"
	printf "************************************************************\n"
	printf "*  7- All IPs                |  8- test                    *\n"
	printf "************************************************************\n"
	printf "*  9- All IPs                | 10- test                    *\n"
	printf "************************************************************\n"
	printf "* 11- All IPs                | 12- test                    *\n"
	printf "************************************************************\n"

	read option
	clear

	case $option in
		1) findIps ;;
		2) number_of_visit_per_ips ;;
		3) top_ips_reffers ;;
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

function again {
	printf "\nback to menu enter 1\n"
    printf "exit enter 0\n"
    read n
    clear
    case $n in
    	1) menu;;
		0) exit;;
    esac
}

# this function find all ips in log file that is (first) parameter and count them
function findIps {
    awk -F\" '{print $1 }' $file | wc | awk '{print "number of all IPs is " $1}' > IPs.txt
	awk '{print $1}' $file | sort | uniq | wc | awk '{print "number of all IPs that are uniq is " $1}' >> IPs.txt
    awk '{print count "times ("$1") repeated from list"}' $file | sort -r | uniq -c | sort -r >> IPs.txt
    awk '{print NR,$1}' $file | uniq > listIPs.txt
    figlet Result
    printf "You can see two file in this directory that show result about IPs.\n\n"
    printf "1- Ips.txt      2- listIPs.txt\n\n"
    printf "********************************************************************\n"
    again
}

# this function find number of visit per each ip
function number_of_visit_per_ips {
    awk '{print "requests from " $1}' $file | sort | uniq -c | sort > visitPerIPs.txt
    figlet Result
    printf "You can see this file in this directory that show number of visit per IPs.\n\n"
    printf "1- visitPerIPs.txt\n\n"
    printf "***************************************************************************\n"
    again
}

# this function find all top 10 of Ips and top 10 of reffers in log file
function top_ips_reffers {
    awk -F\" ' { print $4 } ' $file | grep -v '-' | grep -v 'http://www.semecomplete.com' | sort | uniq -c | sort -rn | head -n 10 > topIps.txt
	awk -F\" ' { print $6 } ' $file | sort | uniq -c | sort -rn | head -n 10 > topReffers.txt
    figlet Result
    printf "You can see two files in this directory that show top 10 of IPs and Reffers.\n\n"
    printf "1- topIps.txt      2- topReffers.txt\n\n"
    printf "***************************************************************************\n"
    again
}

input