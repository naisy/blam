# usage:
# ./blam_rviz

TOP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rosrun rviz rviz -d ${TOP_DIR}/internal/src/blam_example/rviz/lidar_slam.rviz

