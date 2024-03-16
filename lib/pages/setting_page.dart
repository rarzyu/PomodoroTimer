import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';

/// 設定画面
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('setting screen'),
            Expanded(child: Container()),
            FooterComponent(),
          ],
        ),
      ),
    );
  }
}
