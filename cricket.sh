#!/bin/bash

echo "which team"
read team
echo "Enter the over"
read x
y=1
while :
do 
wget -o dum.txt -O file.html http://www.cricbuzz.com/live-cricket-scores/18461/sl-vs-ind-3rd-test-india-tour-of-sri-lanka-2017 
sed -i -e 's/<[^>]*>//g' file.html
grep -o $team\ [0-9][0-9]/[0-9]\ \([0-9]\.[0-9]\ Ovs\) file.html #score double digit overs<10
grep -o $team\ [0-9][0-9][0-9]/[0-9]\ \([0-9][0-9]\.[0-9]\ Ovs\) file.html #score>99 overs>9.6
grep -o $team\ [0-9][0-9]/[0-9]\ \([0-9][0-9]\.[0-9]\ Ovs\) file.html #score >10<99  overs>=10
grep -o $team\ [0-9]/[0-9]\ \([0-9]\.[0-9]\ Ovs\) file.html #score <10 overs <10
grep -o $team\ [0-9]/[0-9]\ \([0-9][0-9]\.[0-9]\ Ovs\) file.html #score <10 overs>10  

grep -o $x\\.$y'[ a-zA-Z0-9,!]\+[    ]' file.html|espeak #speaks the commentry 
grep -o $x\\.$y'[ a-zA-Z0-9,!]\+[    ]' file.html #echos the commentry on stdout
#just trying git command line

if [ "$?" -eq 0 ]
then
y=$(($y+1))
fi
if [ "$y" -eq 7 ]
then
	x=$(($x+1))
	y=1
fi

grep --color -o "India [a-z]\+ [0-9]\+ runs" file.html
sleep 10s
rm file.html
clear
done

