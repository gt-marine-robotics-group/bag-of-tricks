#!/bin/bash

if [ "$1" = '-h' ] || [ "$1" = '--help' ]; then
	printf "Usage: convert.sh <path_to_db3_file> will produce an mcap file in ros_output.\nmcap_conversion.yaml specifies config options such as specific topics to convert\n";
else
	ros2 bag convert -i $1 -o mcap_conversion.yaml;
fi
