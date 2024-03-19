import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';
import 'package:pomodoro_timer/%20components/setting/setting_text_item_component.dart';
import 'package:pomodoro_timer/%20components/setting/setting_toggle_item_component.dart';
import 'package:pomodoro_timer/generated/l10n.dart';

/// 設定画面
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            SettingTextItemComponent(title: S.of(context).workingTime),
            SettingTextItemComponent(title: S.of(context).breakTime),
            SettingTextItemComponent(title: S.of(context).longBreakTime),
            SettingTextItemComponent(
                title: S.of(context).numberOfRepeatUntilLongBreak),
            SettingTextItemComponent(title: S.of(context).numberOfSets),
            SettingToggleItemComponent(title: S.of(context).alert, value: true),
            SettingToggleItemComponent(
                title: S.of(context).vibration, value: false),
            Spacer(),
            FooterComponent(),
          ],
        ),
      ),
    );
  }
}
