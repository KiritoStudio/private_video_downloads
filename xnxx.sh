#!/bin/bash
if [ -z $1 ]; then 
    echo "url is not set."
    exit 1
fi
if [[ $1 != *'www.xnxx.com'* ]]; then 
    echo "url is invalid"
    exit 2
fi
# url='https://www.xnxx.com/video-mb2q9e0/_'
video_url=$(curl $1 | grep "html5player.setVideoUrlHigh" | sed "s/html5player.setVideoUrlHigh('//g" | sed "s/');//g" | xargs | cat)
if [ -z $2 ]; then
    axel -n 20 "$video_url"
else
    axel -n 20 "$video_url" -o $2
fi
