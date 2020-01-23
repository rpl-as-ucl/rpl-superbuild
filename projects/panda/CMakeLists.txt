cmake_minimum_required(VERSION 2.8.12)

# --------------------------
# Compile rpl-panda-ros-pkg
# --------------------------
find_or_build_package_with_tag (rpl-panda-ros-pkg ON)

# --------------------------
# Compile rpl-panda-simulator
# --------------------------
find_or_build_package_with_tag (rpl-panda-simulator OFF)

