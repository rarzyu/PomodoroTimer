import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('home screen'),
            FooterComponent(),
            ]
        ),
      ),
    );
  }
}
