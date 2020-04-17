#!/bin/bash

# test file to record fm radio for a given period of time


# read the global configuration file autowx2_conf.py via the bash/python configuration parser
# do not change the following three lines
scriptDir="$(dirname "$(realpath "$0")")"
source $scriptDir/basedir_conf.py
source $baseDir/_listvars.sh


#### microconfiguration

recdir="$recordingDir/fm/rec/"$(date +"%Y/%m/")

### doing the job

mkdir -p $recdir

fileNameCore="$1"
satellite="$2"
start="$3"
duration="$4"
peak="$5"
azimuth="$6"
freq="$7"


echo "fileNameCore=$fileNameCore"
echo "satellite=$satellite"
echo "start=$start"
echo "duration=$duration"
echo "peak=$peak"
echo "azimuth=$azimuth"
echo "freq=$freq"



# fixed values for tests
# freq="98796500"
# duration="10s"
# fileNameCore="trojka"


echo
echo "Recording to:" $recdir/$fileNameCore.mp3
echo

timeout $duration rtl_fm -d $dongleSerial -f $freq -M wfm -g 49.6 -l 0 -s 220k -A std -E deemp -r 44.1k | sox -t raw -e signed -c 1 -b 16 -r 44000 -V1 - "$recdir/$fileNameCore.mp3"
