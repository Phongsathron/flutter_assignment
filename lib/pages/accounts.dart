import 'package:flutter/material.dart';

class Accounts{
  static Map<String, String> _account = {"admin": "admin"};

  static void showSnackBar(BuildContext context, String content){
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
        },
      ),
    ));
  }

  static bool register(BuildContext context, String username, String password){
    if(_account.containsKey(username)){
      showSnackBar(context, "Email นี้มีอยู่ในระบบอยู่แล้ว");
      return false;
    }

    // if(username.isEmpty || password.isEmpty){
    //   _showSnackBar(context, "กรุณาระบุข้อมูลให้ครบถ้วน");
    //   return false;
    // }

    _account[username] = password;
    return true;
  }

  static bool login(BuildContext context, String username, String password){
    if(!_account.containsKey(username)){
      showSnackBar(context, "ไม่มีผู้ใช้นี้ิอยู่ในระบบ");
      return false;
    }

    if(password == _account[username]){
      return true;
    }

    showSnackBar(context, "Email หรือ Username ไม่ถูกต้อง");
    return false;
  }
}