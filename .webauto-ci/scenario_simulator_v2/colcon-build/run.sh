#!/bin/bash -e

: "${WEBAUTO_CI_SOURCE_PATH:?is not set}"

mkdir -p /home/ubuntu/Desktop/scenario_simulator_ws
cd /home/ubuntu/Desktop/scenario_simulator_ws

mkdir -p src
cp -rfT "$WEBAUTO_CI_SOURCE_PATH"/src src
source /opt/ros/"$ROS_DISTRO"/setup.bash
rosdep update
rosdep install -iry --from-paths src
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
