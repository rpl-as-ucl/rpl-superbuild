# rpl-panda-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper (rpl-panda-ros-pkg
               TYPE GIT
               STYLE GITHUB
               REPOSITORY rpl-as-ucl/rpl-panda-ros-pkg
               TAG master
               COMPONENT robots
               INSTALL_COMMAND ""
              )
