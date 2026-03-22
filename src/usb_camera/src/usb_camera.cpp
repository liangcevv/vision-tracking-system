#include <sys/time.h>

#include <cstring>
#include <iostream>

#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <opencv2/opencv.hpp>
#include <ros/ros.h>
// #include <sensor_msgs/Image.h>
#include <std_msgs/Bool.h>

#include "v4l2.h"

using namespace cv;
using namespace std;

int enable_camera = 1; // 默认使能摄像头

// 订阅回调函数
void enable_camera_callback(const std_msgs::Bool::ConstPtr &msg)
{
  // 在回调函数中处理接收到的消息
  if (msg->data)
  {
    enable_camera = 1;
    ROS_INFO("enable_camera true");
  }
  else
  {
    enable_camera = 0;
    ROS_INFO("enable_camera false");
  }
}

int main(int argc, char **argv)
{
  unsigned int frame_cnt = 0;
  double t = 0, last_t = 0;
  double fps;
  struct timeval tv;

  unsigned char *data_ptr;
  FrameBuf frame_buf;

  ros::init(argc, argv, "usb_camera");
  ros::NodeHandle nh("~");

  string pub_image_topic, dev_name, frame_id;
  int width, height, div;

  nh.param<string>("pub_image_topic", pub_image_topic, "/jpeg_image");
  //   nh.param<string>("pub_image_topic", pub_image_topic, "/image_raw");

  nh.param<string>("dev_name", dev_name, "/dev/video1");

  nh.param<string>("frame_id", frame_id, "camera");

  nh.param<int>("width", width, 1280);

  nh.param<int>("height", height, 720);

  nh.param<int>("div", div, 1);

  //   cv::Mat img(height, width, CV_8UC3);
  //   cv::Mat yuyv_img(height, width, CV_8UC2);
  //   cv::Mat rgb_img(height, width, CV_8UC3);

  ros::Subscriber enable_camera_sub =
      nh.subscribe("/enable_camera", 10, enable_camera_callback);

  ros::Publisher pub =
      nh.advertise<sensor_msgs::CompressedImage>(pub_image_topic, 1);
  //   ros::Publisher pub = nh.advertise<sensor_msgs::Image>(pub_image_topic,
  //   1);

  sensor_msgs::CompressedImage msg;
  //   sensor_msgs::Image msg;

  ros::Rate loop_rate(30); // 30Hz

  int video_index = 0;
  std::string dev_names[4] = {dev_name, "/dev/video0", "/dev/video1",
                              "/dev/video2"};

  if (pub.getNumSubscribers() == 0)
  {
    ROS_INFO("camera subscribers num = 0, do not capture");
  }

  while (nh.ok())
  {
    if (pub.getNumSubscribers() == 0 ||
        enable_camera == 0) // 检查订阅者数目，如果为0，则不采集图像
    {
      ros::spinOnce();
      usleep(100 * 1000); // 100ms
      continue;
    }

    V4l2 v4l2;
    if (v4l2.init_video(dev_names[video_index].c_str(), width, height) <
        0) // 打开视频设备
    {
      ROS_WARN("v4l2 init video error!");
      v4l2.release_video(); // 释放设备
      ros::spinOnce();
      sleep(1);

      // 切换视频设备尝试
      video_index++;
      if (video_index >= 4)
        video_index = 0;

      continue;
    }

    while (nh.ok())
    {
      if (v4l2.get_data(&frame_buf) < 0) // 获取视频数据
      {
        ROS_WARN("v4l2 get data error!");
        v4l2.release_video(); // 释放设备
        ros::spinOnce();
        sleep(1);
        break;
      }

      if (enable_camera == 0) // 检查是否使能摄像头，如果为0则立即停止采集
      {
        ROS_INFO("enable_camera = 0, release video");
        v4l2.release_video(); // 释放设备
        break;
      }

      frame_cnt++;
      if (frame_cnt % 30 == 0)
      {
        gettimeofday(&tv, NULL);
        t = tv.tv_sec + tv.tv_usec / 1000000.0;

        fps = 30.0 / div / (t - last_t);
        ROS_DEBUG("mjpeg read fps %.2f subscribers num =%d", fps,
                  pub.getNumSubscribers());
        // ROS_DEBUG("yuyv read fps %.2f subscribers num =%d", fps,
        //           pub.getNumSubscribers());

        last_t = t;

        if (pub.getNumSubscribers() == 0) // 检查订阅者数目，如果为0则停止采集
        {
          ROS_INFO("camera subscribers num = 0, release video");
          v4l2.release_video(); // 释放设备
          break;
        }
      }

      if (frame_cnt % div != 0)
        continue;

      // printf("frame_buf 0x%X %d\n",frame_buf.start,frame_buf.length);

      // 解码显示
      // img = cv::imdecode(jpeg, IMREAD_COLOR);
      // imshow("img", img);
      // waitKey(1);

      msg.header.stamp = ros::Time::now();
      msg.header.frame_id = frame_id;
      msg.format = "jpeg";
      msg.data.assign(frame_buf.start, frame_buf.start + frame_buf.length);

      pub.publish(msg); // 发布压缩图像
      // 将 YUYV 数据复制到 OpenCV Mat
      // YUYV 格式：每个像素2字节，总大小 = width * height * 2
      //   int yuyv_size = width * height * 2;
      //   if (frame_buf.length >= yuyv_size) {
      //     memcpy(yuyv_img.data, frame_buf.start, yuyv_size);

      //     // 转换 YUYV 到 RGB
      //     cv::cvtColor(yuyv_img, rgb_img, cv::COLOR_YUV2RGB_YUYV);
      //   } else {
      //     ROS_WARN("Frame buffer size error: expected %d, got %d", yuyv_size,
      //              frame_buf.length);
      //     continue;
      //   }

      //   // 使用 cv_bridge 将 OpenCV Mat 转换为 ROS Image 消息
      //   cv_bridge::CvImage cv_image;
      //   cv_image.header.stamp = ros::Time::now();
      //   cv_image.header.frame_id = frame_id;
      //   cv_image.encoding = "rgb8";
      //   cv_image.image = rgb_img;

      //   cv_image.toImageMsg(msg);
      //   pub.publish(msg);  // 发布无压缩图像

      ros::spinOnce();
      loop_rate.sleep(); // 如果比30fps还有空余时间会sleep
    }
  }
}