sleep 0.5s
ps aux | grep "get-sink-volume 0" | head -n 1 | cut -d " " -f 5 | xargs kill
