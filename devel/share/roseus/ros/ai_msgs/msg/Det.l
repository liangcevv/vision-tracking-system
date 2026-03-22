;; Auto-generated. Do not edit!


(when (boundp 'ai_msgs::Det)
  (if (not (find-package "AI_MSGS"))
    (make-package "AI_MSGS"))
  (shadow 'Det (find-package "AI_MSGS")))
(unless (find-package "AI_MSGS::DET")
  (make-package "AI_MSGS::DET"))

(in-package "ROS")
;;//! \htmlinclude Det.msg.html


(defclass ai_msgs::Det
  :super ros::object
  :slots (_x1 _y1 _x2 _y2 _conf _cls_name _cls_id _obj_id ))

(defmethod ai_msgs::Det
  (:init
   (&key
    ((:x1 __x1) 0)
    ((:y1 __y1) 0)
    ((:x2 __x2) 0)
    ((:y2 __y2) 0)
    ((:conf __conf) 0.0)
    ((:cls_name __cls_name) "")
    ((:cls_id __cls_id) 0)
    ((:obj_id __obj_id) 0)
    )
   (send-super :init)
   (setq _x1 (round __x1))
   (setq _y1 (round __y1))
   (setq _x2 (round __x2))
   (setq _y2 (round __y2))
   (setq _conf (float __conf))
   (setq _cls_name (string __cls_name))
   (setq _cls_id (round __cls_id))
   (setq _obj_id (round __obj_id))
   self)
  (:x1
   (&optional __x1)
   (if __x1 (setq _x1 __x1)) _x1)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:x2
   (&optional __x2)
   (if __x2 (setq _x2 __x2)) _x2)
  (:y2
   (&optional __y2)
   (if __y2 (setq _y2 __y2)) _y2)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:cls_name
   (&optional __cls_name)
   (if __cls_name (setq _cls_name __cls_name)) _cls_name)
  (:cls_id
   (&optional __cls_id)
   (if __cls_id (setq _cls_id __cls_id)) _cls_id)
  (:obj_id
   (&optional __obj_id)
   (if __obj_id (setq _obj_id __obj_id)) _obj_id)
  (:serialization-length
   ()
   (+
    ;; uint16 _x1
    2
    ;; uint16 _y1
    2
    ;; uint16 _x2
    2
    ;; uint16 _y2
    2
    ;; float32 _conf
    4
    ;; string _cls_name
    4 (length _cls_name)
    ;; uint16 _cls_id
    2
    ;; uint16 _obj_id
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _x1
       (write-word _x1 s)
     ;; uint16 _y1
       (write-word _y1 s)
     ;; uint16 _x2
       (write-word _x2 s)
     ;; uint16 _y2
       (write-word _y2 s)
     ;; float32 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _cls_name
       (write-long (length _cls_name) s) (princ _cls_name s)
     ;; uint16 _cls_id
       (write-word _cls_id s)
     ;; uint16 _obj_id
       (write-word _obj_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _x1
     (setq _x1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _y1
     (setq _y1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _x2
     (setq _x2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _y2
     (setq _y2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _conf
     (setq _conf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _cls_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cls_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _cls_id
     (setq _cls_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _obj_id
     (setq _obj_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get ai_msgs::Det :md5sum-) "36d7de293104c297a8e98d544eb51f85")
(setf (get ai_msgs::Det :datatype-) "ai_msgs/Det")
(setf (get ai_msgs::Det :definition-)
      "uint16 x1
uint16 y1
uint16 x2
uint16 y2
float32 conf
string cls_name
uint16 cls_id
uint16 obj_id


")



(provide :ai_msgs/Det "36d7de293104c297a8e98d544eb51f85")


