#source /opt/ros/kinetic/setup.bash
TOP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $TOP_DIR
source ${TOP_DIR}/internal/devel/setup.bash --extend

# download subfiles (and build fail)
bash ./update

# accuracy update
PARAMETER_FILE=internal/src/point_cloud_filter/config/parameters.yaml
if [ -f ${PARAMETER_FILE} ]; then
    sed -i 's/^  grid_res: 0.2$/  grid_res: 0.1/g' ${PARAMETER_FILE}
    sed -i 's/^  random_filter: true$/  random_filter: false/g' ${PARAMETER_FILE}
else
    echo "ERROR! ${PARAMETER_FILE} is not found."
    exit
fi
# pcd downsize (and good for accuracy)
PARAMETER_FILE=internal/src/point_cloud_mapper/config/parameters.yaml
if [ -f ${PARAMETER_FILE} ]; then
    sed -i 's/^  octree_resolution: 0.05$/  octree_resolution: 0.2/g' ${PARAMETER_FILE}
else
    echo "ERROR! ${PARAMETER_FILE} is not found."
    exit
fi

# mswenson17's update
# https://github.com/lidar-slam-benchmarking/blam/commit/d9393e94236c8f2d6f2d121608fb54c2d6479700
cp -r patch/* ./

# re-build
cd internal
catkin_make clean blam_example
catkin_make clean blam_slam
catkin_make clean geometry_utils
catkin_make clean laser_loop_closure
catkin_make clean measurement_synchronizer
catkin_make clean parameter_utils
catkin_make clean point_cloud_filter
catkin_make clean point_cloud_localization
catkin_make clean point_cloud_mapper
catkin_make clean point_cloud_odometry
catkin_make clean point_cloud_visualizer
catkin_make clean pose_graph_msgs
rm -rf src/build/*
cd ..

bash ./update
# compile error. boost compile option change
grep -rl ./internal -e '-lBoost::timer' | xargs -n1 file | grep "ASCII text" | cut -d':' -f1 | xargs sed -i 's/-lBoost::timer/-lboost_timer/g'
# build continue
bash ./update

