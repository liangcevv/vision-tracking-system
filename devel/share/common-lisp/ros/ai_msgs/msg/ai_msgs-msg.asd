
(cl:in-package :asdf)

(defsystem "ai_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Det" :depends-on ("_package_Det"))
    (:file "_package_Det" :depends-on ("_package"))
    (:file "Dets" :depends-on ("_package_Dets"))
    (:file "_package_Dets" :depends-on ("_package"))
  ))