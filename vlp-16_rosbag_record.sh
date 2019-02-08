# usage:
# ./vlp-16_rosbag_record.sh output.bag

#source ${TOP_DIR}/internal/devel/setup.bash
OUTPUT_BAG="vlp-16.bag"

case $1 in
    /*\.bag)
        OUTPUT_BAG=$2
        ;;
    *.bag)
        OUTPUT_BAG=$PWD/$2
esac
echo ${OUTPUT_BAG}

roscore &
sleep 3
roslaunch velodyne_pointcloud VLP16_points.launch &
sleep 1
rosrun rosbag record -O $OUTPUT_BAG /velodyne_points

