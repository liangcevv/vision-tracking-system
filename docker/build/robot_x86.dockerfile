FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
COPY apt/sources.list /etc/apt/

RUN apt-get clean && \
    apt-get autoclean
RUN apt update && \
    apt install  -y \
    curl \
    lsb-release \
    gnupg gnupg1 gnupg2 \
    gdb \
    vim \
    htop \
    apt-utils \
    curl \
    cmake \
    net-tools \
    python3 python3-pip 

# 添加ROS源
# ===== 添加 ROS GPG key（离线方式）===== 下载自https://raw.githubusercontent.com/ros/rosdistro/master/ros.key
COPY keys/ros.key /tmp/ros.key

RUN mkdir -p /usr/share/keyrings && \
    gpg --dearmor /tmp/ros.key && \
    mv /tmp/ros.key.gpg /usr/share/keyrings/ros-archive-keyring.gpg

# ===== 添加 ROS 源（中科大）=====
RUN echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
http://mirrors.ustc.edu.cn/ros/ubuntu \
$(lsb_release -sc) main" \
> /etc/apt/sources.list.d/ros-latest.list



RUN apt update && \
    apt install -y ros-noetic-desktop-full \
     python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential \
     ros-noetic-teleop-twist-keyboard ros-noetic-move-base-msgs ros-noetic-move-base ros-noetic-map-server ros-noetic-base-local-planner ros-noetic-dwa-local-planner ros-noetic-teb-local-planner ros-noetic-global-planner ros-noetic-gmapping ros-noetic-amcl libudev-dev

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc


    

# RUN pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple
# RUN pip install --upgrade pip
# RUN pip install \
#     opencv-python  \ 
#     pulsectl \
#     pyttsx3 \
#     pyzbar \
#     gpio \
#     python-periphery \
#     sounddevice \
#     httpx \
#     pycryptodome  \
#     pytz \
#     dashscope openai pyaudio flask \          
#     websocket-client==1.8.0 websockets \     


COPY install/ydlidar-sdk /tmp/install/ydlidar-sdk
RUN /tmp/install/ydlidar-sdk/install_ydlidar_sdk.sh



RUN echo "source /robot/devel/setup.bash" >> ~/.bashrc

WORKDIR /robot
 