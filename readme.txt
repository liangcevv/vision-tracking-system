x86下：
cd ~/vision-tracking-system

# 清理旧编译
catkin_make clean

# 编译（指定路径）
catkin_make \
  -DONNXRT_LIBRARY=/opt/onnxruntime/lib/libonnxruntime.so \
  -DONNXRT_INCLUDE_DIR=/opt/onnxruntime/include


# 使能开启雷达和目标跟踪：
rostopic pub -1 /enable_tracking std_msgs/Bool "data: true"
rostopic pub -1 /enable_lidar std_msgs/Bool "data: true"