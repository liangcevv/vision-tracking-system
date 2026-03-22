; Auto-generated. Do not edit!


(cl:in-package ai_msgs-msg)


;//! \htmlinclude Det.msg.html

(cl:defclass <Det> (roslisp-msg-protocol:ros-message)
  ((x1
    :reader x1
    :initarg :x1
    :type cl:fixnum
    :initform 0)
   (y1
    :reader y1
    :initarg :y1
    :type cl:fixnum
    :initform 0)
   (x2
    :reader x2
    :initarg :x2
    :type cl:fixnum
    :initform 0)
   (y2
    :reader y2
    :initarg :y2
    :type cl:fixnum
    :initform 0)
   (conf
    :reader conf
    :initarg :conf
    :type cl:float
    :initform 0.0)
   (cls_name
    :reader cls_name
    :initarg :cls_name
    :type cl:string
    :initform "")
   (cls_id
    :reader cls_id
    :initarg :cls_id
    :type cl:fixnum
    :initform 0)
   (obj_id
    :reader obj_id
    :initarg :obj_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Det (<Det>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Det>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Det)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ai_msgs-msg:<Det> is deprecated: use ai_msgs-msg:Det instead.")))

(cl:ensure-generic-function 'x1-val :lambda-list '(m))
(cl:defmethod x1-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:x1-val is deprecated.  Use ai_msgs-msg:x1 instead.")
  (x1 m))

(cl:ensure-generic-function 'y1-val :lambda-list '(m))
(cl:defmethod y1-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:y1-val is deprecated.  Use ai_msgs-msg:y1 instead.")
  (y1 m))

(cl:ensure-generic-function 'x2-val :lambda-list '(m))
(cl:defmethod x2-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:x2-val is deprecated.  Use ai_msgs-msg:x2 instead.")
  (x2 m))

(cl:ensure-generic-function 'y2-val :lambda-list '(m))
(cl:defmethod y2-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:y2-val is deprecated.  Use ai_msgs-msg:y2 instead.")
  (y2 m))

(cl:ensure-generic-function 'conf-val :lambda-list '(m))
(cl:defmethod conf-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:conf-val is deprecated.  Use ai_msgs-msg:conf instead.")
  (conf m))

(cl:ensure-generic-function 'cls_name-val :lambda-list '(m))
(cl:defmethod cls_name-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:cls_name-val is deprecated.  Use ai_msgs-msg:cls_name instead.")
  (cls_name m))

(cl:ensure-generic-function 'cls_id-val :lambda-list '(m))
(cl:defmethod cls_id-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:cls_id-val is deprecated.  Use ai_msgs-msg:cls_id instead.")
  (cls_id m))

(cl:ensure-generic-function 'obj_id-val :lambda-list '(m))
(cl:defmethod obj_id-val ((m <Det>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ai_msgs-msg:obj_id-val is deprecated.  Use ai_msgs-msg:obj_id instead.")
  (obj_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Det>) ostream)
  "Serializes a message object of type '<Det>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y2)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cls_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cls_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cls_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cls_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obj_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'obj_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Det>) istream)
  "Deserializes a message object of type '<Det>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y2)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cls_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cls_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cls_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cls_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obj_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'obj_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Det>)))
  "Returns string type for a message object of type '<Det>"
  "ai_msgs/Det")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Det)))
  "Returns string type for a message object of type 'Det"
  "ai_msgs/Det")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Det>)))
  "Returns md5sum for a message object of type '<Det>"
  "36d7de293104c297a8e98d544eb51f85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Det)))
  "Returns md5sum for a message object of type 'Det"
  "36d7de293104c297a8e98d544eb51f85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Det>)))
  "Returns full string definition for message of type '<Det>"
  (cl:format cl:nil "uint16 x1~%uint16 y1~%uint16 x2~%uint16 y2~%float32 conf~%string cls_name~%uint16 cls_id~%uint16 obj_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Det)))
  "Returns full string definition for message of type 'Det"
  (cl:format cl:nil "uint16 x1~%uint16 y1~%uint16 x2~%uint16 y2~%float32 conf~%string cls_name~%uint16 cls_id~%uint16 obj_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Det>))
  (cl:+ 0
     2
     2
     2
     2
     4
     4 (cl:length (cl:slot-value msg 'cls_name))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Det>))
  "Converts a ROS message object to a list"
  (cl:list 'Det
    (cl:cons ':x1 (x1 msg))
    (cl:cons ':y1 (y1 msg))
    (cl:cons ':x2 (x2 msg))
    (cl:cons ':y2 (y2 msg))
    (cl:cons ':conf (conf msg))
    (cl:cons ':cls_name (cls_name msg))
    (cl:cons ':cls_id (cls_id msg))
    (cl:cons ':obj_id (obj_id msg))
))
