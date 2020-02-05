# usage:
# ./vlp-16_rosbag_record.sh output.bag

#source ${TOP_DIR}/internal/devel/setup.bash

case $1 in
    /*\.bag)
        OUTPUT_BAG=$1
        ;;
    *.bag)
        OUTPUT_BAG=$PWD/$1
esac
echo ${OUTPUT_BAG}

roscore &
sleep 3
roslaunch velodyne_pointcloud VLP16_points.launch &
sleep 1
rosrun rosbag record -a -O $OUTPUT_BAG

