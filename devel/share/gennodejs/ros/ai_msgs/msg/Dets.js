// Auto-generated. Do not edit!

// (in-package ai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Det = require('./Det.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Dets {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.dets = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('dets')) {
        this.dets = initObj.dets
      }
      else {
        this.dets = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Dets
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [dets]
    // Serialize the length for message field [dets]
    bufferOffset = _serializer.uint32(obj.dets.length, buffer, bufferOffset);
    obj.dets.forEach((val) => {
      bufferOffset = Det.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Dets
    let len;
    let data = new Dets(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [dets]
    // Deserialize array length for message field [dets]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.dets = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.dets[i] = Det.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.dets.forEach((val) => {
      length += Det.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ai_msgs/Dets';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd1999d0746b539c8853b8929d95aeea9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
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
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Dets(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.dets !== undefined) {
      resolved.dets = new Array(msg.dets.length);
      for (let i = 0; i < resolved.dets.length; ++i) {
        resolved.dets[i] = Det.Resolve(msg.dets[i]);
      }
    }
    else {
      resolved.dets = []
    }

    return resolved;
    }
};

module.exports = Dets;
