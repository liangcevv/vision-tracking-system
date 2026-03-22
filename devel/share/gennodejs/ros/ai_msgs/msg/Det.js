// Auto-generated. Do not edit!

// (in-package ai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Det {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x1 = null;
      this.y1 = null;
      this.x2 = null;
      this.y2 = null;
      this.conf = null;
      this.cls_name = null;
      this.cls_id = null;
      this.obj_id = null;
    }
    else {
      if (initObj.hasOwnProperty('x1')) {
        this.x1 = initObj.x1
      }
      else {
        this.x1 = 0;
      }
      if (initObj.hasOwnProperty('y1')) {
        this.y1 = initObj.y1
      }
      else {
        this.y1 = 0;
      }
      if (initObj.hasOwnProperty('x2')) {
        this.x2 = initObj.x2
      }
      else {
        this.x2 = 0;
      }
      if (initObj.hasOwnProperty('y2')) {
        this.y2 = initObj.y2
      }
      else {
        this.y2 = 0;
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0.0;
      }
      if (initObj.hasOwnProperty('cls_name')) {
        this.cls_name = initObj.cls_name
      }
      else {
        this.cls_name = '';
      }
      if (initObj.hasOwnProperty('cls_id')) {
        this.cls_id = initObj.cls_id
      }
      else {
        this.cls_id = 0;
      }
      if (initObj.hasOwnProperty('obj_id')) {
        this.obj_id = initObj.obj_id
      }
      else {
        this.obj_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Det
    // Serialize message field [x1]
    bufferOffset = _serializer.uint16(obj.x1, buffer, bufferOffset);
    // Serialize message field [y1]
    bufferOffset = _serializer.uint16(obj.y1, buffer, bufferOffset);
    // Serialize message field [x2]
    bufferOffset = _serializer.uint16(obj.x2, buffer, bufferOffset);
    // Serialize message field [y2]
    bufferOffset = _serializer.uint16(obj.y2, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.float32(obj.conf, buffer, bufferOffset);
    // Serialize message field [cls_name]
    bufferOffset = _serializer.string(obj.cls_name, buffer, bufferOffset);
    // Serialize message field [cls_id]
    bufferOffset = _serializer.uint16(obj.cls_id, buffer, bufferOffset);
    // Serialize message field [obj_id]
    bufferOffset = _serializer.uint16(obj.obj_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Det
    let len;
    let data = new Det(null);
    // Deserialize message field [x1]
    data.x1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [y1]
    data.y1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [x2]
    data.x2 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [y2]
    data.y2 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cls_name]
    data.cls_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [cls_id]
    data.cls_id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [obj_id]
    data.obj_id = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.cls_name);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ai_msgs/Det';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36d7de293104c297a8e98d544eb51f85';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Det(null);
    if (msg.x1 !== undefined) {
      resolved.x1 = msg.x1;
    }
    else {
      resolved.x1 = 0
    }

    if (msg.y1 !== undefined) {
      resolved.y1 = msg.y1;
    }
    else {
      resolved.y1 = 0
    }

    if (msg.x2 !== undefined) {
      resolved.x2 = msg.x2;
    }
    else {
      resolved.x2 = 0
    }

    if (msg.y2 !== undefined) {
      resolved.y2 = msg.y2;
    }
    else {
      resolved.y2 = 0
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0.0
    }

    if (msg.cls_name !== undefined) {
      resolved.cls_name = msg.cls_name;
    }
    else {
      resolved.cls_name = ''
    }

    if (msg.cls_id !== undefined) {
      resolved.cls_id = msg.cls_id;
    }
    else {
      resolved.cls_id = 0
    }

    if (msg.obj_id !== undefined) {
      resolved.obj_id = msg.obj_id;
    }
    else {
      resolved.obj_id = 0
    }

    return resolved;
    }
};

module.exports = Det;
