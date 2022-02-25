#!/bin/bash
while true; do
echo "MADE BY IGOR KERNOZ, FROM RUSSIA"
echo "Programm name 'Check edited file date'"
echo "_______________________"
echo "The current dir is the:"
pwd
echo "Find file in this dir. Name:"
fileExists=0
while [ "$fileExists" -ne 1 2>error.txt ]
do
	read fileName
	if [[ -f "$fileName" ]]
	then
		echo "The $fileName file exists!"
		((fileExists++))
	else
		echo "The $fileName file doesnt exists, you want to continue? (y/n)"
		read ys
		if [ $ys = y ]
			echo "Enter the name of file again."
			then continue
		else break
		fi
	fi
done
echo "Please enter the date by form YYYYMMDD:"
datecorrect=0
while [ "$datecorrect" -ne 1 ]
do
	read date
	if  date -d "$date" +%D
	then
		echo "Date was correct"
		((datecorrect++))
	else
		echo "Date incorrect, try again? (y/n)"
		read yd
		if [ $yd = y ]
			echo "Enter the date of file again."
			then continue
		else break
		fi
	fi
done
	Edited=$(stat -c %y "$fileName" 2>error.txt)
	if [[ $date < $Edited ]]
	then
		echo "CODE:120"
		exit 120
	else
	echo "Edited before"
	fi
echo "The programm has ended. Do you want to continue? (y/n)"
	read yn
	if [ $yn = y ]
	then continue
	else break
	fi
done
