;; Auto-generated. Do not edit!


(when (boundp 'ai_msgs::Dets)
  (if (not (find-package "AI_MSGS"))
    (make-package "AI_MSGS"))
  (shadow 'Dets (find-package "AI_MSGS")))
(unless (find-package "AI_MSGS::DETS")
  (make-package "AI_MSGS::DETS"))

(in-package "ROS")
;;//! \htmlinclude Dets.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ai_msgs::Dets
  :super ros::object
  :slots (_header _dets ))

(defmethod ai_msgs::Dets
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:dets __dets) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _dets __dets)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:dets
   (&rest __dets)
   (if (keywordp (car __dets))
       (send* _dets __dets)
     (progn
       (if __dets (setq _dets (car __dets)))
       _dets)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ai_msgs/Det[] _dets
    (apply #'+ (send-all _dets :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ai_msgs/Det[] _dets
     (write-long (length _dets) s)
     (dolist (elem _dets)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ai_msgs/Det[] _dets
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dets (let (r) (dotimes (i n) (push (instance ai_msgs::Det :init) r)) r))
     (dolist (elem- _dets)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ai_msgs::Dets :md5sum-) "d1999d0746b539c8853b8929d95aeea9")
(setf (get ai_msgs::Dets :datatype-) "ai_msgs/Dets")
(setf (get ai_msgs::Dets :definition-)
      "std_msgs/Header header
Det[] dets

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ai_msgs/Det
uint16 x1
uint16 y1
uint16 x2
uint16 y2
float32 conf
string cls_name
uint16 cls_id
uint16 obj_id


")



(provide :ai_msgs/Dets "d1999d0746b539c8853b8929d95aeea9")


