#! /bin/bash

url=$(grep $1 "Link:" | cut -d' ' -f2)

if [[ $(echo $url | grep -c "youtube") -eq 1 ]]
then
	mpv $url
else
	echo $url >> ~/sitesToRead/readinglist.txt
fi

