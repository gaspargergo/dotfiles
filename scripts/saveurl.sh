#! /bin/bash

url=$(grep $1 "Link:" | cut -d' ' -f2)

if [[ $(echo $url | grep -c "youtube") -eq 1 ]]
then
	yt-dlp --embed-subs --restrict-filenames -f 'best[height<=720]' -o '/home/gergo/videos/%(title)s.%(ext)s' $url
else
	echo $url >> ~/sitesToRead/readinglist.txt
fi

