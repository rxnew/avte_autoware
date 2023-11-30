#!/bin/bash -e

: "${WEBAUTO_CI_SOURCE_PATH:?is not set}"
: "${WORKDIR:?is not set}"

mkdir -p "$WORKDIR"
cd "$WORKDIR"

mkdir -p src
cp -rfT "$WEBAUTO_CI_SOURCE_PATH"/src src
# shellcheck disable=SC2012
ROS_DISTRO=$(ls -1 /opt/ros | head -1)
source /opt/ros/"$ROS_DISTRO"/setup.bash
rosdep update
rosdep install -iry --from-paths src
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
