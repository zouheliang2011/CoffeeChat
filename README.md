# CoffeeChat

opensource im with server(go) and client(flutter+swift)

## Features

### 设计

- [x] 架构设计：参考瓜子 IM
- [x] 协议设计：参考网易云 IM、环信、TeamTalk
- [x] 数据库设计
- [x] 消息分表存储设计
- [x] IM 消息 ID 生成设计

### 单聊群聊

- [x] flutter 客户端
- [x] 单聊
- [x] 多媒体消息：文本
- [x] 会话列表
- [x] 消息存储
- [x] 历史消息
- [x] 漫游消息（用户切换到任何设备都可以读取到最近的历史消息）
- [ ] 离线消息（用户离线重新上线后收到最近 30 天的未读消息）
- [ ] 多媒体消息：表情
- [ ] 多媒体消息：图片
- [x] 未读消息计数
- [ ] 消息推送(APNS)

- [ ] 群聊
- [ ] 群最高人数：200
- [ ] 群管理：群主、加人、踢人
- [ ] 群消息免打扰
- [ ] 群成员管理

### 服务端特有

- [ ] 负载均衡
- [ ] 双机容灾
- [ ] 性能压测Benchmark
- [ ] 业务监控
- [ ] Redis集群
- [ ] docker

## 客户端特有

- [ ] 消息推送提醒（系统通知栏消息提醒）
- [ ] 消息转发
- [ ] 网络连接状态
- [ ] 图片管理器
- [ ] 查找聊天记录
- [ ] 消息同步缓存
- [x] 会话同步缓存
- [ ] 头像同步缓存
- [ ] 未读计数桌面角标
- [ ] 免打扰模式
- [ ] 图片压缩

### 特色功能

- [ ] 阅后即焚
- [ ] 撤回
- [ ] 正在输入
- [ ] 已读回执（用户发送消息，获取对方是否已读状态 ）
- [ ] 多终端已读同步（同个产品多终端情况下，同步消息已读未读的状态）
- [ ] 端到端加密
- [ ] 高清语音消息
- [ ] 文件上传下载
- [ ] 语音通话
- [ ] 视频通话
- [ ] electron跨平台桌面客户端
- [x] flutter跨平台移动端
- [ ] swift/iOS客户端+SDK
- [ ] kotlin/Android客户端+SDK
- [ ] vue/Web客户端+SDK

### 客服功能

- [ ] 客服会话
- [ ] 欢迎语
- [ ] 自动分配在线客服
- [ ] 客服正在输入提醒
- [ ] 回头客

### 智能问答功能

- [ ] AnyQ百度开源FAQ问答系统接入

### 聊天机器人功能

- [ ] 图灵机器人接入

## Architecture

## Quick Start

### Build

### Run

### Environment

### Configuration

### Dependencies

### Document

## Examples

## Benchmark

## LICENSE

CoffeeChat is provided under the [mit license](https://github.com/xmcy0011/CoffeeChat/blob/master/LICENSE).