# usage:
# ./autoware-bag_to_velodyne-bag.sh autoware_datetime.bag vlp-16.bag

#rosrun rosbag topic_renamer.py <in topic> <in bag> <out topic> <out bag>

INPUT_TOPIC=/points_raw
OUTPUT_TOPIC=/velodyne_points

PWD=`pwd`

case $1 in
    *\.bag)
        INPUT_BAG=`realpath $1`
    ;;
esac
case $2 in
    /*\.bag)
        OUTPUT_BAG=$2
        ;;
    *.bag)
        OUTPUT_BAG=$PWD/$2
esac

rosrun rosbag topic_renamer.py $INPUT_TOPIC $INPUT_BAG $OUTPUT_TOPIC $OUTPUT_BAG

