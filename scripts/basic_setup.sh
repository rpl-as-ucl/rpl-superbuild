#!/bin/sh

sudo apt-get update

# essential
sudo apt-get install git cmake cmake-curses-gui build-essential gitg git-gui meld vim terminator mercurial libmatio-dev doxygen

# ROS list and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Gazebo list and key
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update

if [ "`lsb_release -cs`" = 'xenial' ]; then
        sudo apt-get install ros-kinetic-desktop-full
	 sudo apt-get install ros-kinetic-eigen-conversions ros-kinetic-kdl-parser ros-kinetic-effort-controllers ros-kinetic-controller-manager ros-kinetic-transmission-interface
        sudo apt-get install ros-kinetic-gazebo-ros-pkgs

fi

if [ "`lsb_release -cs`" = 'bionic' ]; then
        sudo apt-get install ros-melodic-desktop-full
	 sudo apt-get install ros-melodic-eigen-conversions ros-melodic-kdl-parser ros-melodic-effort-controllers ros-melodic-controller-manager ros-melodic-transmission-interface
        sudo apt-get install ros-melodic-gazebo-ros-pkgs

fi

# ROS config
sudo apt-get -y --allow-unauthenticated install python-pip
sudo apt-get -y --allow-unauthenticated install python-rosdep
sudo rosdep init
rosdep update
