; Auto-generated. Do not edit!


(cl:in-package ai_msgs-msg)


;//! \htmlinclude Dets.msg.html

(cl:defclass <Dets> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (dets
    :reader dets
    :initarg :dets
    :type (cl:vector ai_msgs-msg:Det)
   :initform (cl:make-array 0 :element-type 'ai_msgs-msg:Det :initial-element (cl:make-instance 'ai_msgs-msg:Det))))
)

(cl:defclass Dets (<Dets>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Dets>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Dets)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ai_msgs-msg:<Dets> is deprecated: use ai_msgs-msg:Dets instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Dets>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:header-val is deprecated.  Use ai_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'dets-val :lambda-list '(m))
(cl:defmethod dets-val ((m <Dets>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:dets-val is deprecated.  Use ai_msgs-msg:dets instead.")
  (dets m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Dets>) ostream)
  "Serializes a message object of type '<Dets>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dets))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'dets))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Dets>) istream)
  "Deserializes a message object of type '<Dets>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dets) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dets)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ai_msgs-msg:Det))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Dets>)))
  "Returns string type for a message object of type '<Dets>"
  "ai_msgs/Dets")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Dets)))
  "Returns string type for a message object of type 'Dets"
  "ai_msgs/Dets")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Dets>)))
  "Returns md5sum for a message object of type '<Dets>"
  "d1999d0746b539c8853b8929d95aeea9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Dets)))
  "Returns md5sum for a message object of type 'Dets"
  "d1999d0746b539c8853b8929d95aeea9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Dets>)))
  "Returns full string definition for message of type '<Dets>"
  (cl:format cl:nil "std_msgs/Header header~%Det[] dets~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ai_msgs/Det~%uint16 x1~%uint16 y1~%uint16 x2~%uint16 y2~%float32 conf~%string cls_name~%uint16 cls_id~%uint16 obj_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Dets)))
  "Returns full string definition for message of type 'Dets"
  (cl:format cl:nil "std_msgs/Header header~%Det[] dets~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ai_msgs/Det~%uint16 x1~%uint16 y1~%uint16 x2~%uint16 y2~%float32 conf~%string cls_name~%uint16 cls_id~%uint16 obj_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Dets>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dets) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Dets>))
  "Converts a ROS message object to a list"
  (cl:list 'Dets
    (cl:cons ':header (header msg))
    (cl:cons ':dets (dets msg))
))
