#!/bin/bash
tmux send-keys -t sub_01:main.2 "ros2 launch pontus_bringup auv.launch.py auv:=auv"
tmux send-keys -t sub_01:main.3 'ros2 launch pontus_perception yolo.launch.py'

tmux send-keys -t sub_01:sensors.0 'ros2 launch pontus_sensors low_light.launch.py'
tmux send-keys -t sub_01:sensors.1 'ros2 launch pontus_sensors dvl.launch.py'
tmux send-keys -t sub_01:sensors.2 'ros2 launch pontus_sensors sonoptix.launch.py'

tmux send-keys -t sub_01:etc.0 'ros2 launch pontus_bringup direct_auv.launch.py auv:=auv'
tmux send-keys -t sub_01:etc.2 'ros2 run pontus_bringup record_all_topics.sh'
