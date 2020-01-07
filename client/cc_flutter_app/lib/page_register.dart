import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cc_flutter_app/page_login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

//const DefaultServerIp = "10.0.107.254";
const DefaultHttpServerPort = 18080;
const DefaultRegisterUserAPI = "/user/register";

// 注册页面
class PageRegisterStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageRegisterStatefulWidget();
}

class _PageRegisterStatefulWidget extends State<PageRegisterStatefulWidget> {
  final _userIdController = TextEditingController(text: "3");
  final _nickNameController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "12345");
  static const kShrineBrown900 = Color(0xFF442B2D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoffeeChat"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
            PrimaryColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _userIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '请输入用户ID',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            PrimaryColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _nickNameController,
                decoration: const InputDecoration(
                  labelText: '请输入昵称',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            PrimaryColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '请输入密码',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                child: const Text('注 册'),
                elevation: 8.0,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: _onRegister,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ip = prefs.getString("local_server_ip");

    var userId = _userIdController.text;
    var nickName = _nickNameController.text;
    var token = _passwordController.text;

    if (userId.isEmpty) {
      Toast.show("请输入用户ID", context, gravity: Toast.CENTER, duration: 3);
      return;
    }
    if (nickName.isEmpty) {
      Toast.show("请输入昵称", context, gravity: Toast.CENTER, duration: 3);
      return;
    }
    if (token.isEmpty) {
      Toast.show("请输入口令", context, gravity: Toast.CENTER, duration: 3);
      return;
    }

    var iUserId = int.tryParse(userId);
    if (iUserId == null) {
      Toast.show("请输入有效的由数字组成的用户ID", context, gravity: Toast.CENTER, duration: 3);
      return;
    }

    _showLoading((closeDialog) async {
      // http注册用户
      var result = await postRegister(ip, iUserId, nickName, token);

      closeDialog();

      // 跳转到登录界面
      if (result) {
        Navigator.of(this.context).pop({'userId': userId, 'nickName': nickName, 'pwd': token});
      }
    });
  }

  Future<void> _showLoading(Function closeDialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return new NetLoadingDialog(
          dismissDialog: closeDialog,
          outsideDismiss: false,
        );
      },
    );
  }

  // 调用http接口注册
  postRegister(String ip, int userId, String nickName, String token) async {
    var dio = Dio();
    dio.options.baseUrl = "http://" + ip + ":" + DefaultHttpServerPort.toString();
    var response = await dio.post(DefaultRegisterUserAPI,
        data: {'user_id': userId, 'user_nick_name': nickName, 'user_token': token},
        options: Options(contentType: Headers.jsonContentType));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      if (data['error_code'] == 0) {
        Toast.show("注册成功，即将跳转...", context, gravity: Toast.CENTER, duration: 3);
        return true;
      } else {
        Toast.show("注册失败：" + data['error_msg'].toString(), context, gravity: Toast.CENTER, duration: 3);
        return false;
      }
    }
    return false;
  }
}
