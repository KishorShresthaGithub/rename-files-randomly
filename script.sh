#!/bin/bash

#random string of fixed length
function get_random_string() {
  	head -3 /dev/urandom | tr -cd '[:alnum:]' | cut -c -$1;
}

function iterate_files (){
		for file in *;do
			random_string=$(get_random_string $1);
			filename=$(basename $file)
			fileext=$(echo "${filename##*.}")
			
			if [ "$fileext" != "sh" ];then
			 	mv $file "$random_string.$fileext";
			fi
		done;
}
set -e;

if [ -z $1 ];then
	iterate_files 5
else
 	iterate_files $1;
fi
	
