#! /bin/bash


#  ____              _       _   ____                    _   _                    
# |  _ \  __ _ _ __ (_) __ _| | | __ )  __ _ _   _  __ _| |_(_)                                                                                                                                                  
# | | | |/ _` | '_ \| |/ _` | | |  _ \ / _` | | | |/ _` | __| |                                         
# | |_| | (_| | | | | | (_| | | | |_) | (_| | |_| | (_| | |_| |                   
# |____/ \__,_|_| |_|_|\__,_|_| |____/ \__,_|\__, |\__,_|\__|_|                   
#                                            |___/                                

#   ___   ___  _  __    ___ _____ _____                                           
#  / _ \ ( _ )/ |/ /_  / _ \___  |___ /                                           
# | (_) |/ _ \| | '_ \| | | | / /  |_ \                                           
#  \__, | (_) | | (_) | |_| |/ /  ___) |                                          
#    /_/ \___/|_|\___/ \___//_/  |____/                                           
                                                 
#     _                     _               _                _            
#    / \   _ __   __ _  ___| |__   ___     / \   _ __   __ _| |_   _ _______ _ __                           
#   / _ \ | '_ \ / _` |/ __| '_ \ / _ \   / _ \ | '_ \ / _` | | | | |_  / _ \ '__|  
#  / ___ \| |_) | (_| | (__| | | |  __/  / ___ \| | | | (_| | | |_| |/ /  __/ |   
# /_/   \_\ .__/ \__,_|\___|_| |_|\___| /_/   \_\_| |_|\__,_|_|\__, /___\___|_|    
#         |_|                                                  |___/              

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

	printf "\n********************************************************************************\n"
	printf "*                             choose option below                              *\n"
	printf "********************************************************************************\n"
	printf "*  1- all IPs                           |  2- number of visit per IPs          *\n"
	printf "********************************************************************************\n"
	printf "*  3- top 10 IPs & referrs              |  4- request per day realtime         *\n"
	printf "********************************************************************************\n"
	printf "*  5- range of OK status requests       |  6- range of ERROR status requests    \n"
	printf "********************************************************************************\n"
	printf "*  7- count all response code           |  8- test                              \n"
	printf "********************************************************************************\n"
	printf "*  9- All IPs                           | 10- test                              \n"
	printf "********************************************************************************\n"
	printf "* 11- All IPs                           | 12- test                              \n"
	printf "********************************************************************************\n"

	read option
	clear

	case $option in
		1) findIps ;;
		2) number_of_visit_per_ips ;;
		3) top_ips_reffers ;;
		4) request_per_day ;;
		5) success_status ;;
		6) error_status ;;
		7) count_response_code ;;
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

# this function find all requests per day and list of all realtime request
function request_per_day {
    awk '{print $4}' $file | cut -d: -f1 | uniq -c > requestPerDay.txt
	awk '{ printf("%-15s\t%s\t%s\t%s\n", $1, $6, $9, $7) }' $file > realtimeRequest.txt
    figlet Result
    printf "You can see two files in this directory that show requests realtime and per day.\n\n"
    printf "1- requestPerDay.txt      2- realtimeRequest.txt\n\n"
    printf "********************************************************************************\n"
    again
}

# this function show all item that status requests are between 200 and 304 that show succsess
function success_status {
    awk '($9 ~ /200|206|300|301|304/)' $file | awk '{print $9,$7}' | sort | uniq > succesStatus.txt
    figlet Result
    printf "You can see this file in this directory that show all requests status success.\n\n"
    printf "1- succesStatus.txt\n\n"
    printf "********************************************************************************\n"
    again
}

# this function show all item that status requests are between 400 and 504 that show error
function error_status {
    awk '($9 !~ /200|206|300|301|304/)' $file | awk '{print $9,$7}' | sort | uniq > errorStatus.txt
    figlet Result
    printf "You can see this file in this directory that show all requests status error.\n\n"
    printf "1- errorStatus.txt\n\n"
    printf "********************************************************************************\n"
    again
}

# this function count number of all response code that are succesfuly or not
function count_response_code {
    awk '{print $9}' $file | sort | uniq -c | sort -rn > countResponseCode.txt
    figlet Result
    printf "You can see this file in this directory that show count of responsees code.\n\n"
    printf "1- countResponseCode.txt\n\n"
    printf "********************************************************************************\n"
    again
}

input