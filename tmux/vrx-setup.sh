#!/bin/bash

# Make sure to run chmod +x <file path>
# to give this file executable permissions!

# VRX tmux script
# Assumes a file structure of 
# mrg/
#   vrx_ws/     (where the VRX simulation lives)
#   dev_ws/     (where Virtuoso and other relevant code lives)

session="VRX"

tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then

tmux new-session -d -s $session 

tmux rename-window -t 0 'Sim'
tmux send-keys -t 'Sim' 'cd ~/mrg' C-m 'source /opt/ros/humble/setup.bash' C-m 'source ~/mrg/vrx_ws/install/setup.bash' C-m 'VRX_X=$HOME/mrg/dev_ws/src/Virtuoso/utils/vrx/x_drive/usv.urdf' C-m 'ros2 launch vrx_gz competition.launch.py world:=sydney_regatta'

tmux new-window -t $session:1 -n 'Virtuoso1'
tmux send-keys -t 'Virtuoso1' 'cd ~/mrg/dev_ws' C-m 'source /opt/ros/humble/setup.bash' C-m 'source install/setup.bash' C-m

tmux new-window -t $session:2 -n 'Virtuoso2'
tmux send-keys -t 'Virtuoso2' 'cd ~/mrg/dev_ws' C-m 'source /opt/ros/humble/setup.bash' C-m 'source install/setup.bash' C-m

tmux new-window -t $session:3 -n 'Helper1'
tmux send-keys -t 'Helper1' 'source /opt/ros/humble/setup.bash' C-m

tmux new-window -t $session:4 -n 'Helper2'
tmux send-keys -t 'Helper2' 'source /opt/ros/humble/setup.bash' C-m

fi

tmux attach-session -t $session:0
