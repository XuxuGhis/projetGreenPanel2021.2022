#!/bin/bash


#line=$

#echo $line


influx write -b example-bucket -f /home/pi/essaisgigi/example.csv #--skipHeader=2
	     --header "#constant measurement, headerdeghis" \
             --header "#datatype dateTime:2006-01-02,long,tag"


curl -i XPOST "https:// LINK" --data-binary @cpu-data.txt
#curl -i XPOST "https:// LINK" --data-binary $line
