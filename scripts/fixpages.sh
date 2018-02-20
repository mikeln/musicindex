#!/bin/bash

renum='^[0-9]+$'
startquote='^"'

if [ "$#" -lt 1 ];then
	echo "ERROR! You must enter a file location"
	exit 1
fi

#e.g. file="./realbk1h.csv"
file="$1"
newfile="$file.new"

if [ -e "$file" ];then
	# erase old (new) file if present
	echo  > ${newfile}

	# file has to be sorted by ascending start page values (vs titles) NOTE: quoted titles with commas will not process correctly
	# sort -k3 -n -t, <file>
	tmpsort=$(mktemp /tmp/indexsort.XXXXXXXX)
	sort -k3,3 -n -t, -o ${tmpsort} ${file}
	
	echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "  Calculating ending pages for each title"
	echo ""
	echo " NOTE: Quoted Titles with commas will not process"
	echo "       correctly!  ALWAY VALIDATE END FILE BY HAND"
	echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

	prev_title=""
	prev_book=""
	prev_start=""
	prev_end=""
	next_page=""

	# note: read the whole line...so we can write it to the new file if in doubt
	# old way...
  #while IFS=, read -r t01 b01 p01 p02
  while read -r line00
	do
		IFS=',' read -ra myf <<< "$line00"
		#for i in "${myf[@]}";do
		#	echo "$line00 Fields: $i"
		#done
		t01="${myf[0]}"
		b01="${myf[1]}"
		p01="${myf[2]}"
		p02="${myf[3]}"

		# if the line starts with a " ignore it for now...
		if [[ $t01 =~ $startquote ]];then
			echo "Title is Quoted... ignoring.. you need to add it yourself $t01"
			# write the line out directly
			echo "$line00">>${newfile}
		else

		# need to read two lines so we can calculate the previous end page number
		if [ "$prev_title" == "" ] && [ "$prev_book" == "" ] && [ "$prev_start" == "" ];then
			# first time through 
			prev_title="$t01"
			prev_book="$b01"
			prev_start="$p01"
			prev_end="$p02"
			echo "First record: $prev_title:$prev_book:$prev_start:$prev_end"
		else
			# we need to calculate the previous end page (if it isn't set already)
			if ! [[ $prev_end =~ $renum ]];then
				# end is not a number...need to calculate it based on the current start page
				# if the current start page is a number! 
				if ! [[ $p01 =~ $renum ]];then
					echo "ERROR! Start page is not a number: $p01 - you will have to hand edit end page for $prev_title"
					# default to same as start page (1 page chart)
					prev_end=$prev_start
				else
					# watch for bookmarks on same page...do not subtract in that case!!!
					if [ "$p01" == "$prev_start" ];then
						prev_end=$p01
					else
					  # wierd bashism to get text number arithmetic
					  prev_end=$(( ${p01}-1 ))
				  fi
				fi
			else
				echo "Already has an end page: $prev_title"
			fi
			echo "New Record: $prev_title,$prev_book,$prev_start,$prev_end"
			# write the line out
			echo "$prev_title,$prev_book,$prev_start,$prev_end">>${newfile}

			# load the current into the previous
			prev_title="$t01"
			prev_book="$b01"
			prev_start="$p01"
			prev_end="$p02"
		fi
	  fi
	done < "$tmpsort"
	echo "Final record: you will have to hand edit end page for $prev_title"
	# write the line out
	echo "$prev_title,$prev_book,$prev_start,$prev_end">>${newfile}
	# remove temporary
	rm ${tmpsort}
else
	echo "ERROR! File $file does not exist"
	exit 1
fi
exit 0
