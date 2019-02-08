# usage:
# ./active_to_bag.sh input.bag.active output.bag

PWD=`pwd`

case $1 in
    *\.bag\.active)
        INPUT_ACTIVE=`realpath $1`
    ;;
esac
case $2 in
    /*\.bag)
        OUTPUT_BAG=$2
        ;;
    *.bag)
        OUTPUT_BAG=$PWD/$2
esac

rosbag reindex $INPUT_ACTIVE
rosbag fix $INPUT_ACTIVE $OUTPUT_BAG

