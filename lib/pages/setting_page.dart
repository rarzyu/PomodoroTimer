import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/futter_widget.dart';

/// 設定画面
class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('setting screen'),
            FutterWidget(),
          ],
        ),
      ),
    );
  }
}