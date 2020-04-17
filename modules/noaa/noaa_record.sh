#!/bin/bash

# file to record NOAA satellites via rtl_fm
# all variables are provided by noaa.sh


#
# recording here
#

timeout $duration rtl_fm -d $dongleSerial $biast -f $freq -s $sample -g $dongleGain -F 9 -A fast -E offset -p $dongleShift $recdir/$fileNameCore.raw | tee -a $logFile

#
# transcoding here
#

sox -t raw -r $sample -es -b 16 -c 1 -V1 $recdir/$fileNameCore.raw $recdir/$fileNameCore.wav rate $wavrate | tee -a $logFile
touch -r $recdir/$fileNameCore.raw $recdir/$fileNameCore.wav
rm $recdir/$fileNameCore.raw
