# rpl-panda-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper (rpl-realsense
               TYPE GIT
               STYLE GITHUB
               REPOSITORY rpl-as-ucl/rpl-realsense
               TAG master
               COMPONENT sensors
               INSTALL_COMMAND ""
              )
