#!/bin/bash

ROBOTOLOGY_ROOT=$(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))

export ROBOTOLOGY_ROOT

export RPL_ROOT=$ROBOTOLOGY_ROOT

if [ -f $ROBOTOLOGY_ROOT/build/active_profile ]; then
    source $ROBOTOLOGY_ROOT/build/active_profile
else
    export ROBOTOLOGY_PROFILE=SIMULATION
fi

pathadd() {
    if [ -z ${!1} ]; then
        export $1=$2
    elif [ -d "$2" ] && [[ ! ${!1} =~ (^|:)$2(:|$) ]]; then
        export $1+=:$2
    fi
}

# ROS distribution sourcing
if [ -f /opt/ros/kinetic/setup.bash ]; then
    source /opt/ros/kinetic/setup.bash
fi

if [ -f /opt/ros/melodic/setup.bash ]; then
    source /opt/ros/melodic/setup.bash
fi

# External packages sourcing
if [ -f ${ROBOTOLOGY_ROOT}/external/moveit/install/setup.bash ]; then
    source ${ROBOTOLOGY_ROOT}/external/moveit/install/setup.bash
fi

# Gazebo sourcing
if [ -f /usr/share/gazebo/setup.sh ]; then
    source /usr/share/gazebo/setup.sh
fi

export PATH=$ROBOTOLOGY_ROOT/build/install/bin:$PATH
export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib:$LD_LIBRARY_PATH
export LTDL_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib/roboptim-core:$LTDL_LIBRARY_PATH
pathadd CMAKE_PREFIX_PATH $ROBOTOLOGY_ROOT/build/install
export ROS_PACKAGE_PATH=$ROBOTOLOGY_ROOT/build/install/share:$ROS_PACKAGE_PATH
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/stacks
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/lib

pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/gazebo_models
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/rpl-panda-ros-pkg
pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/rpl-panda-ros-pkg/panda_gazebo/database

pathadd CPATH $ROBOTOLOGY_ROOT/build/install/include
pathadd CPATH /opt/ros/${ROS_DISTRO}/include
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/site-packages
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/dist-packages

pathadd PKG_CONFIG_PATH $ROBOTOLOGY_ROOT/build/install/lib/pkgconfig
pathadd GAZEBO_PLUGIN_PATH /opt/ros/${ROS_DISTRO}/lib
pathadd GAZEBO_PLUGIN_PATH $ROBOTOLOGY_ROOT/build/install/lib

if [ -d $ROBOTOLOGY_ROOT/robots/iit-panda-ros-pkg ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/iit-panda-ros-pkg
fi

# Some aliases for superbuild/scripts
alias superbuild=". ${ROBOTOLOGY_ROOT}/scripts/superbuild.sh"
source ${ROBOTOLOGY_ROOT}/scripts/superbuild.profile

# add robotology folder for robot models
if [ -d $ROBOTOLOGY_ROOT/build/install/share/robots ]; then
	export ROBOTOLOGY_ROBOTS=$ROBOTOLOGY_ROOT/build/install/share/robots
else
	unset ROBOTOLOGY_ROBOTS
fi
