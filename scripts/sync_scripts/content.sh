#!/bin/bash

for url in $(cat /home/gergo/sitesToRead/readinglist.txt)
do
	if [[ $(echo $url | grep -c "youtube") -eq 1 ]]
	then
		yt-dlp --embed-subs --force-ipv4 --restrict-filenames -f "((bv*[fps>30]/bv*)[height<=720]/(wv*[fps>30]/wv*)) + ba / (b[fps>30]/b)[height<=720]/(w[fps>30]/w)" -o '/home/gergo/videos/%(title)s.%(ext)s' $url
	elif [[ $(echo $url | grep -c "gemini://") -eq 1 ]]
	then
		gemget -d ~/sitesToRead/ $url
	else
		if [[ $(echo $url | rev | cut -c1) = "/" ]] #if no page name, use last part of url. otherwise we would end up with a bunch of index.html
		then
			wget --progress=bar --timeout=5 -p -k -R "*.js,*.eot,*.woff,*.woff2,*.ttf,*.otf,*.txt" -P ~/sitesToRead/ -E --default-page=$(echo $url | rev | cut -d'/' -f2 |rev) $url
		else
			wget --progress=bar --timeout=5 -p -k -R "*.js,*.eot,*.woff,*.woff2,*.ttf,*.otf,*.txt" -P ~/sitesToRead/ -E $url
		fi
	fi
done

echo "" > ~/sitesToRead/readinglist.txt
