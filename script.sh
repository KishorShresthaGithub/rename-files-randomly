#!/bin/bash


set -e;

# random string of fixed length
function get_random_string() {
  	head -3 /dev/urandom | tr -cd '[:alnum:]' | cut -c -$1;
}

function iterate_files (){
		for file in *;do
		# store random string in to var	
			random_string=$(get_random_string $2);
		# get file ext
			filename=$(basename $file)
			fileext=$(echo "${filename##*.}")
		#rename file with ext
		# $1 is the ext
		# #2 is the length of string
			if [ -z $1 ];then
				echo "Renaming all files...";
			 	mv $file "$random_string.$fileext";
			else
				echo "Renaming all $2 $1 files...";
			 	mv $file "$random_string.$1";
			fi
		done;
}

if [ -z $2 ];then
	iterate_files "" 5
else
 	iterate_files $1 $2;
fi
	
