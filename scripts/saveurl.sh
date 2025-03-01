#! /bin/bash

url=$(grep $1 "Link:" | cut -d' ' -f2)

if [[ $(echo $url | grep -c "youtube") -eq 1 ]]
then
	yt-dlp --embed-subs --force-ipv4 --restrict-filenames -f "((bv*[fps>30]/bv*)[height<=720]/(wv*[fps>30]/wv*)) + ba / (b[fps>30]/b)[height<=720]/(w[fps>30]/w)" -o '/home/gergo/videos/%(title)s.%(ext)s' $url

else
	echo $url >> ~/sitesToRead/readinglist.txt
fi

