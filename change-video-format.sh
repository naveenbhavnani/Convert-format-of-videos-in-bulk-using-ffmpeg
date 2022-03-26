#!/bin/bash

if [[ -n "$1" ]] && [[ -n "$2" ]]
then
    echo "Converting videos in folder = ${1} to format = ${2}"

# loop over all files and run ffmpeg commands
    for FILE in $1; 
        do
        dirname="$(dirname "${FILE}")"
        filename="$(basename "${FILE}")"

        # get filename and change extension to the one passed as argument
        output_filename="${filename%%.*}.${2}" 
        output_path="${dirname}/${output_filename}"
        echo "converting file $FILE to $output_filename";
        # convert video
        ffmpeg -i $FILE $output_path
        done
else
    echo "Mandatory arguments not provided"
    echo "Command usage: change-video-format.sh folder-path video-format"
fi

