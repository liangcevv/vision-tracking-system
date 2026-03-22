cmake_minimum_required(VERSION 3.0.2)
project(rknn_yolov6)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  image_transport
  cv_bridge #https://www.cnblogs.com/long5683/p/16060461.html
  ai_msgs
)

find_package(OpenCV REQUIRED) #https://www.cnblogs.com/long5683/p/16060461.html

# 如果OpenCV被成功找到，打印其版本信息
if(OpenCV_FOUND)
    message(STATUS "OpenCV found version ${OpenCV_VERSION}")
    message(STATUS "OpenCV include path: ${OpenCV_INCLUDE_DIRS}")
    message(STATUS "OpenCV libraries: ${OpenCV_LIBRARIES}")
endif()


catkin_package(
CATKIN_DEPENDS ai_msgs  # 依赖的消息包
)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

file(GLOB_RECURSE SOURCES src/*.cpp)

add_executable(${PROJECT_NAME}
${SOURCES}
)

add_dependencies(${PROJECT_NAME} ai_msgs_generate_messages_cpp)

message(STATUS "CMAKE_HOST_SYSTEM_PROCESSOR ${CMAKE_HOST_SYSTEM_PROCESSOR}")
if(CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "aarch64")
    add_definitions(-DUSE_ARM_LIB=1)
    message(STATUS "define USE_ARM_LIB 1")
    include_directories(
        /usr/include/rga
    )
    target_link_libraries(${PROJECT_NAME}
      ${catkin_LIBRARIES}
      ${OpenCV_LIBS}
      rga
      rknn_api
      rknnrt
    )
else()
    add_definitions(-DUSE_ARM_LIB=0)
    message(STATUS "define USE_ARM_LIB 0")

    # Optional: enable ONNX Runtime backend on x86 Linux for running .onnx models.
    # Usage example:
    #   catkin_make -DENABLE_ONNXRT=ON -DORT_ROOT=/opt/onnxruntime
    option(ENABLE_ONNXRT "Enable ONNX Runtime backend (x86)" ON)
    set(ORT_ROOT "" CACHE PATH "ONNX Runtime root dir (contains include/ and lib/)")

    if(ENABLE_ONNXRT)
        if(ORT_ROOT)
            set(_ORT_HINTS "${ORT_ROOT}")
            set(_ORT_INCLUDE_HINTS "${ORT_ROOT}/include")
            set(_ORT_LIB_HINTS "${ORT_ROOT}/lib" "${ORT_ROOT}/lib64")
        endif()

        find_path(ONNXRT_INCLUDE_DIR
            NAMES onnxruntime_cxx_api.h
            HINTS ${_ORT_INCLUDE_HINTS} ${_ORT_HINTS}
            PATH_SUFFIXES include
        )
        find_library(ONNXRT_LIBRARY
            NAMES onnxruntime
            HINTS ${_ORT_LIB_HINTS} ${_ORT_HINTS}
            PATH_SUFFIXES lib lib64
        )

        if(ONNXRT_INCLUDE_DIR AND ONNXRT_LIBRARY)
            message(STATUS "ONNX Runtime found: ${ONNXRT_LIBRARY}")
            message(STATUS "ONNX Runtime include: ${ONNXRT_INCLUDE_DIR}")
            add_definitions(-DUSE_ONNXRT=1)
            include_directories(${ONNXRT_INCLUDE_DIR})
        else()
            message(WARNING "ONNX Runtime not found. Build will fall back to OpenCV demo path on x86. Set -DORT_ROOT=/path/to/onnxruntime to enable ONNX inference.")
            add_definitions(-DUSE_ONNXRT=0)
        endif()
    else()
        add_definitions(-DUSE_ONNXRT=0)
    endif()

    target_link_libraries(${PROJECT_NAME}
       ${catkin_LIBRARIES}
       ${OpenCV_LIBS}
       ${ONNXRT_LIBRARY}
    )
endif()

