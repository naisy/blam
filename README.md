# B(erkeley) L(ocalization) A(nd) M(apping)!

![alt text](https://github.com/erik-nelson/blam/raw/master/blam_mosaic.png)

***BLAM!*** is an open-source software package for LiDAR-based real-time 3D localization and mapping. ***BLAM!*** is developed by Erik Nelson from the Berkeley AI Research Laboratory ([BAIR](http://bair.berkeley.edu)). See https://youtu.be/08GTGfNneCI for a video example.

## Updates
* Add mswenson17's update. Good for offline BLAM.
* Parameter changed. Good for offline BLAM.
* Run on Ubuntu 16.04 and ros kinetic.

This fork is for offline BLAM. Online BLAM (Realtime SLAM) should use erik-nelson's repository.

## Build Instructions
This repository contains two ROS workspaces (one internal, one external). The build process is proctored by the `build.sh` script. To build, first make sure that you do not have any other ROS workspaces in your `ROS_PACKAGE_PATH`, then clone the repository and from the top directory execute

First, install MKL and GTSAM.
* [Intel MKL](https://software.intel.com/en-us/mkl/)
* [GTSAM](https://bitbucket.org/gtborg/gtsam)
```bash
./build.sh
```

## Run Instructions
***BLAM!*** is written in C++ with some Python interface elements, wrapped by
Robot Operating System ([ROS](http://ros.org)). Input LiDAR data should be
provided to the `/velodyne_points` topic using message type `sensor_msgs::PointCloud2`.

To run in online mode (e.g. by replaying a bag file from another terminal or
using a real-time sensor stream), use

```bash
./blam_online.sh
```

To run in offline mode, i.e. by loading a bagfile and processing its data as
fast as possible, set the bagfile name and scan topic in
`blam_example/launch/test_offline.launch`, and use

```bash
./blam_offline.sh vlp-16.bag
```

An example .rviz configuration file is provided under
`blam_example/rviz/lidar_slam.rviz`.

```bash
./blam_rviz.sh
```

## PCD Files
```bash
ls -l pcd_online
ls -l pcd_offline
```

## VLP-16: Save to ROSBAG
```bash
./vlp-16_rosbag_record.sh output.bag
```

## VLP-16: RVIz
* flame: velodyne
* add: PointCloud2

```bash
./vlp-16_rviz.sh
```


## Dependencies

***BLAM!*** relies on system installations of the following packages:

* [ROS](http://wiki.ros.org/ROS/Installation)
* [GTSAM](https://bitbucket.org/gtborg/gtsam)

GTSAM in particular should be installed from source using the latest version of the develop branch from https://bitbucket.org/gtborg/gtsam. GTSAM relies on Boost, an incorrect version of which will interfere with some of ROS' packages if ROS is not upgraded to at least Indigo. ROS Indigo, in turn, relies on Ubuntu 14.04.
