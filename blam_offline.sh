TOP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR=${TOP_DIR}/pcd_offline
ROSBAG_FILE="/home/ubuntu/vlp-16.bag"

source ${TOP_DIR}/internal/devel/setup.bash
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR
roscore&
sleep 3
roslaunch blam_example test_offline.launch bagfile:=$ROSBAG_FILE &
sleep 3
rosrun pcl_ros pointcloud_to_pcd input:=/blam/blam_slam/octree_map_updates _prefix:=$OUTPUT_DIR/map_

