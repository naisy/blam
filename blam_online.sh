# usage:
# ./blam_online.sh

TOP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR=${TOP_DIR}/pcd_online
TOPIC=/blam/blam_slam/octree_map
#TOPIC=/blam/blam_slam/octree_map_updates # many outputs

source ${TOP_DIR}/internal/devel/setup.bash
mkdir -p $OUTPUT_DIR

roscore&
sleep 3
roslaunch velodyne_pointcloud VLP16_points.launch &
sleep 1
roslaunch blam_example test_online.launch &
sleep 3
rosrun pcl_ros pointcloud_to_pcd input:=$TOPIC _prefix:=$OUTPUT_DIR/map_

