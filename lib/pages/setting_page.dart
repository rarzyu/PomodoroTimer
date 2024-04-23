import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';
import 'package:pomodoro_timer/%20components/setting/setting_text_item_component.dart';
import 'package:pomodoro_timer/%20components/setting/setting_toggle_item_component.dart';
import 'package:pomodoro_timer/constants/setting_key.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/providers/setting_provider.dart';

/// 設定画面
class SettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingModel = ref.watch(settingProvider);
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
              SettingTextItemComponent(
                  title: S.of(context).workingTime,
                  value: settingModel.workTime,
                  onChanged: (value) =>
                      handleChangeSetting(ref, value, SettingKey.workTime),
                  maxLength: 3),
              SettingTextItemComponent(
                  title: S.of(context).breakTime,
                  value: settingModel.breakTime,
                  onChanged: (value) =>
                      handleChangeSetting(ref, value, SettingKey.breakTime),
                  maxLength: 3),
              SettingTextItemComponent(
                  title: S.of(context).longBreakTime,
                  value: settingModel.longBreakTime,
                  onChanged: (value) =>
                      handleChangeSetting(ref, value, SettingKey.longBreakTime),
                  maxLength: 3),
              SettingTextItemComponent(
                  title: S.of(context).numberOfRepeatUntilLongBreak,
                  value: settingModel.numberUntilLongBreak,
                  onChanged: (value) => handleChangeSetting(
                      ref, value, SettingKey.numberUntilLongBreak),
                  maxLength: 2),
              SettingTextItemComponent(
                  title: S.of(context).numberOfSets,
                  value: settingModel.numberSets,
                  onChanged: (value) =>
                      handleChangeSetting(ref, value, SettingKey.numberSets),
                  maxLength: 2),
              SettingToggleItemComponent(
                  title: S.of(context).alert,
                  value: settingModel.isAlert,
                  onChanged: (value) =>
                      handleChangeSetting(ref, value, SettingKey.isAlert)),
              SettingToggleItemComponent(
                  title: S.of(context).vibration,
                  value: settingModel.isVibration,
                  onChanged: (value) =>
                      handleChangeSetting(ref, value, SettingKey.isVibration)),
              Spacer(),
              FooterComponent(),
            ],
          ),
        ),
      ),
    );
  }

  /// 子コンポーネントの設定変更ハンドラー
  void handleChangeSetting(WidgetRef ref, var value, SettingKey key) {
    ref.read(settingProvider.notifier).changeModel(value, key);
  }
}
