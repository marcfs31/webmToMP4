
#!/bin/bash
#Author: marcfs31@github.com

file=`basename $1`
file="${file%.*}"

#Reverse mode
if [ $3 == "r" ]; then
	if [ $2 == "l" ]; then
        	# low quality webm
		ffmpeg -i $1 -acodec libvorbis -vcodec libvpx -vb 2000k -vf scale=iw/2:ih/2 -f webm $file.lq.webm
	elif [ $2 == "h" ]; then
        	# high quality webm
	        ffmpeg -i $1 -acodec libvorbis -vcodec libvpx -vb 8000k -f webm $file.h.webm
	fi
else #Normal mode
	if [ $2 == "l" ]; then
		# low quality MP4
		ffmpeg -i $1 -acodec libfaac -vcodec libx264 -vb 2000k -vf scale=iw/2:ih/2 -f mp4 $file.lq.mp4
	elif [ $2 == "h" ]; then
		# high quality MP4
		ffmpeg -i $1 -acodec libfaac -vcodec libx264 -vb 8000k -f mp4 $file.h.mp4
	fi
fi

