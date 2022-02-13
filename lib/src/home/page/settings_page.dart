import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometending/src/login/login_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MaterialButton(
            elevation: 0,
            color: Colors.grey,
            onPressed: () {
              Get.to(() => LoginPage());
            },
            child: Text('로그인'),
          ),
        ],
      ),
    );
  }
}
