# usage:
# ./vlp-16_rviz.sh

TOP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rosrun rviz rviz -d "${TOP_DIR}/vlp-16.rviz"

