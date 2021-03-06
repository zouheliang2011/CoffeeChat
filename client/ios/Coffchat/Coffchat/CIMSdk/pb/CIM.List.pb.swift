// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: CIM.List.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// 最近聊天会话列表请求
struct CIM_List_CIMRecentContactSessionReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// cmd id:		0x0201
  var userID: UInt64 = 0

  /// 最后更新时间
  var latestUpdateTime: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct CIM_List_CIMRecentContactSessionRsp {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// cmd id:		0x0202
  var userID: UInt64 = 0

  /// 总未读数量
  var unreadCounts: UInt32 = 0

  /// 会话列表
  var contactSessionList: [CIM_Def_CIMContactSessionInfo] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// 历史离线聊天消息请求
struct CIM_List_CIMGetMsgListReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// cmd id:		0x0205
  var userID: UInt64 = 0

  var sessionType: CIM_Def_CIMSessionType = .kCimSessionTypeInvalid

  var sessionID: UInt64 = 0

  ///   uint64 from_time_stamp = 4; // 起始时间点，单位：毫秒
  ///   uint64 end_time_stamp = 5;  // 结束时间点，单位：毫秒
  var endMsgID: UInt64 = 0

  /// 本次查询消息的条数上线(最多100条)
  var limitCount: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

///对于群而言，如果消息数目返回的数值小于请求的cnt,则表示群的消息能拉取的到头了，更早的消息没有权限拉取。
///如果limit_count 和 msg_list.count 不一致，说明服务器消息有缺失，需要
///客户端做一个缺失标记，避免下次再次拉取。
struct CIM_List_CIMGetMsgListRsp {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// cmd id:		0x0206
  var userID: UInt64 = 0

  var sessionType: CIM_Def_CIMSessionType = .kCimSessionTypeInvalid

  var sessionID: UInt64 = 0

  /// 结束服务器消息id(不包含在查询结果中)
  var endMsgID: UInt64 = 0

  ///   uint64 from_time_stamp = 4;     // 起始时间点，单位：毫秒
  ///   uint64 end_time_stamp = 5;      // 结束时间点，单位：毫秒
  var msgList: [CIM_Def_CIMMsgInfo] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "CIM.List"

extension CIM_List_CIMRecentContactSessionReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CIMRecentContactSessionReq"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .standard(proto: "latest_update_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.userID)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.latestUpdateTime)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.userID != 0 {
      try visitor.visitSingularUInt64Field(value: self.userID, fieldNumber: 1)
    }
    if self.latestUpdateTime != 0 {
      try visitor.visitSingularUInt32Field(value: self.latestUpdateTime, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CIM_List_CIMRecentContactSessionReq, rhs: CIM_List_CIMRecentContactSessionReq) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.latestUpdateTime != rhs.latestUpdateTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CIM_List_CIMRecentContactSessionRsp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CIMRecentContactSessionRsp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .standard(proto: "unread_counts"),
    3: .standard(proto: "contact_session_list"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.userID)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.unreadCounts)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.contactSessionList)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.userID != 0 {
      try visitor.visitSingularUInt64Field(value: self.userID, fieldNumber: 1)
    }
    if self.unreadCounts != 0 {
      try visitor.visitSingularUInt32Field(value: self.unreadCounts, fieldNumber: 2)
    }
    if !self.contactSessionList.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.contactSessionList, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CIM_List_CIMRecentContactSessionRsp, rhs: CIM_List_CIMRecentContactSessionRsp) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.unreadCounts != rhs.unreadCounts {return false}
    if lhs.contactSessionList != rhs.contactSessionList {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CIM_List_CIMGetMsgListReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CIMGetMsgListReq"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .standard(proto: "session_type"),
    3: .standard(proto: "session_id"),
    4: .standard(proto: "end_msg_id"),
    6: .standard(proto: "limit_count"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.userID)
      case 2: try decoder.decodeSingularEnumField(value: &self.sessionType)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.sessionID)
      case 4: try decoder.decodeSingularUInt64Field(value: &self.endMsgID)
      case 6: try decoder.decodeSingularUInt32Field(value: &self.limitCount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.userID != 0 {
      try visitor.visitSingularUInt64Field(value: self.userID, fieldNumber: 1)
    }
    if self.sessionType != .kCimSessionTypeInvalid {
      try visitor.visitSingularEnumField(value: self.sessionType, fieldNumber: 2)
    }
    if self.sessionID != 0 {
      try visitor.visitSingularUInt64Field(value: self.sessionID, fieldNumber: 3)
    }
    if self.endMsgID != 0 {
      try visitor.visitSingularUInt64Field(value: self.endMsgID, fieldNumber: 4)
    }
    if self.limitCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.limitCount, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CIM_List_CIMGetMsgListReq, rhs: CIM_List_CIMGetMsgListReq) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.sessionType != rhs.sessionType {return false}
    if lhs.sessionID != rhs.sessionID {return false}
    if lhs.endMsgID != rhs.endMsgID {return false}
    if lhs.limitCount != rhs.limitCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CIM_List_CIMGetMsgListRsp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CIMGetMsgListRsp"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .standard(proto: "session_type"),
    3: .standard(proto: "session_id"),
    4: .standard(proto: "end_msg_id"),
    6: .standard(proto: "msg_list"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.userID)
      case 2: try decoder.decodeSingularEnumField(value: &self.sessionType)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.sessionID)
      case 4: try decoder.decodeSingularUInt64Field(value: &self.endMsgID)
      case 6: try decoder.decodeRepeatedMessageField(value: &self.msgList)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.userID != 0 {
      try visitor.visitSingularUInt64Field(value: self.userID, fieldNumber: 1)
    }
    if self.sessionType != .kCimSessionTypeInvalid {
      try visitor.visitSingularEnumField(value: self.sessionType, fieldNumber: 2)
    }
    if self.sessionID != 0 {
      try visitor.visitSingularUInt64Field(value: self.sessionID, fieldNumber: 3)
    }
    if self.endMsgID != 0 {
      try visitor.visitSingularUInt64Field(value: self.endMsgID, fieldNumber: 4)
    }
    if !self.msgList.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.msgList, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CIM_List_CIMGetMsgListRsp, rhs: CIM_List_CIMGetMsgListRsp) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.sessionType != rhs.sessionType {return false}
    if lhs.sessionID != rhs.sessionID {return false}
    if lhs.endMsgID != rhs.endMsgID {return false}
    if lhs.msgList != rhs.msgList {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
