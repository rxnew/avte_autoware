#!/bin/bash -e

apt-get -y update
apt-get -y install ros-humble-rmw-cyclonedds-cpp

mkdir -p /home/ubuntu/Desktop/scenario_simulator_ws
