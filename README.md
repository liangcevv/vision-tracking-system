# Vision Tracking System

基于 ROS 的目标跟踪系统，支持 USB 摄像头、激光雷达和 RKNN 加速的目标检测。

## 系统架构

- **usb_camera**: USB 摄像头数据采集
- **img_decode**: 图像解码（支持共享内存传输）
- **rknn_yolov6**: 基于 RKNN 的 YOLOv6 目标检测
- **object_track**: 目标跟踪模块
- **ydlidar**: 激光雷达数据采集
- **shm_transport**: 共享内存通信（可选）

## 依赖

- ROS (Noetic/Melodic)
- OpenCV
- ONNX Runtime
- RKNN Toolkit

## 编译方法

### x86 平台

```bash
cd ~/vision-tracking-system

# 清理旧编译
catkin_make clean

# 编译（指定 ONNX Runtime 路径）
catkin_make \
  -DONNXRT_LIBRARY=/opt/onnxruntime/lib/libonnxruntime.so \
  -DONNXRT_INCLUDE_DIR=/opt/onnxruntime/include
```

### 运行

```bash
# 使能追踪和雷达
rostopic pub -1 /enable_tracking std_msgs/Bool "data: true"
rostopic pub -1 /enable_lidar std_msgs/Bool "data: true"
```

---

## 第三方代码声明

本项目包含以下第三方代码和库，均按其原始许可证条款使用：

### 1. shm_transport (BSD License)
- **来源**: https://github.com/Jrdevil-Wang/shm_transport
- **作者**: Jrdevil-Wang, Wende Tan
- **描述**: ROS 共享内存通信传输库，用于提高同一机器上不同进程间通信效率
- **使用位置**: `src/shm_transport/`

### 2. YDLidar-SDK (MIT License)
- **来源**: EAIBOT
- **作者**: EAIBOT
- **描述**: 激光雷达 SDK
- **使用位置**: `src/ydlidar/YDLidar-SDK/`

包含以下子组件：
- **serial** (MIT License) - Copyright (c) 2012 William Woodall, John Harrison
- **angles.h** (BSD License) - Copyright (c) 2008 Willow Garage, Inc.
- **network** (BSD License) - Copyright (c) 2006 CarrierLabs, LLC.

### 3. test11_description (MIT License)
- **来源**: https://github.com/syuntoku14/fusion2urdf
- **作者**: Toshinori Kitamura (syuntoku14)
- **描述**: URDF 描述文件
- **使用位置**: `src/test11_description/`

---

## License

本项目自有代码（除上述第三方代码外）的版权归项目作者所有。

第三方代码的许可证文件位于各自目录内：
- `src/shm_transport/package.xml` (BSD)
- `src/ydlidar/YDLidar-SDK/LICENSE.txt` (MIT)
- `src/test11_description/LICENSE` (MIT)