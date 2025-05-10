#!/bin/bash
date=$(date --date="yesterday" +%Y%m%d)
filename="flSs"$date"_1200.txt.zip"
if [[ -f "/home/gergo/scripts/last_weather/$filename" ]]; then
	echo "Already cached."
else
	echo "Downloading weather"
	rm /home/gergo/scripts/last_weather/*
	wget "https://odp.met.hu/weather/text_forecast/regional_forecast/flSs/txt/$filename" -P "/home/gergo/scripts/last_weather/"
	if [[ $? -ne 0 ]]; then #if wget exits with an error, probably we have a new file for today
		date=$(date +%Y%m%d)
		filename="flSs"$date"_1200.txt.zip"
		wget "https://odp.met.hu/weather/text_forecast/regional_forecast/flSs/txt/$filename" -P "/home/gergo/scripts/last_weather/"
	fi
	unzip "/home/gergo/scripts/last_weather/$filename"
fi
iconv -f iso-8859-1 -t utf-8 "${filename%.*}"
