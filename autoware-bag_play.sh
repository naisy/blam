# usage:
# ./autoware-bag_play.sh autoware_datetime.bag

case $1 in
    *\.bag)
        ROSBAG_FILE=`realpath $1`
    ;;
esac

rosbag play $ROSBAG_FILE /points_raw:=/velodyne_points
