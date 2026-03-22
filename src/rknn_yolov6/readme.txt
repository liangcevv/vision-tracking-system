改名为 /opt/onnxruntime 再软链或直接解压到 /opt/onnxruntime，就用：
catkin_make -DORT_ROOT=/opt/onnxruntime

若运行节点时报错找不到 libonnxruntime.so，先设置再运行：
export LD_LIBRARY_PATH=/opt/onnxruntime/lib:$LD_LIBRARY_PATH
roslaunch rknn_yolov6 rknn_yolov6_onnx_x86.launch

或把该路径写进 ~/.bashrc，或把 lib 里的 .so 拷到系统库路径并执行 sudo ldconfig。

总结：
打开官方 Release 页
浏览器打开：https://github.com/microsoft/onnxruntime/releases
选一个稳定版本（例如 v1.16.3 或当前最新的 Stable）。 
到GitHub onnxruntime releases 下载 onnxruntime-linux-x64-版本号.tgz
解压到例如 /opt/onnxruntime，用 -DORT_ROOT=解压后的目录 编译即可。