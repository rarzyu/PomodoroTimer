import 'package:flutter/material.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';
import 'package:pomodoro_timer/%20components/setting/setting_text_item_component.dart';
import 'package:pomodoro_timer/%20components/setting/setting_toggle_item_component.dart';
import 'package:pomodoro_timer/constants/setting_key.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/view_models/setting_view_model.dart';

/// 設定画面
class SettingPage extends StatefulWidget {
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  final SettingViewModel settingViewModel = SettingViewModel();

  @override
  void initState() {
    super.initState();
    settingViewModel.init().then((_) {
      if (mounted) {
        setState(() {}); // ViewModelの読み込み完了後に画面更新
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!settingViewModel.isLoaded) {
      settingViewModel.initState();
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 15)),
                SettingTextItemComponent(
                    title: S.of(context).workingTime,
                    value: settingViewModel.settingModel!.workTime,
                    onChanged: (value) =>
                        handleChangeSetting(value, SettingKey.workTime)),
                SettingTextItemComponent(
                    title: S.of(context).breakTime,
                    value: settingViewModel.settingModel!.breakTime,
                    onChanged: (value) =>
                        handleChangeSetting(value, SettingKey.breakTime)),
                SettingTextItemComponent(
                    title: S.of(context).longBreakTime,
                    value: settingViewModel.settingModel!.longBreakTime,
                    onChanged: (value) =>
                        handleChangeSetting(value, SettingKey.longBreakTime)),
                SettingTextItemComponent(
                    title: S.of(context).numberOfRepeatUntilLongBreak,
                    value: settingViewModel.settingModel!.numberUntilLongBreak,
                    onChanged: (value) => handleChangeSetting(
                        value, SettingKey.numberUntilLongBreak)),
                SettingTextItemComponent(
                    title: S.of(context).numberOfSets,
                    value: settingViewModel.settingModel!.numberSets,
                    onChanged: (value) =>
                        handleChangeSetting(value, SettingKey.numberSets)),
                SettingToggleItemComponent(
                    title: S.of(context).alert,
                    value: settingViewModel.settingModel!.isAlert,
                    onChanged: (value) =>
                        handleChangeSetting(value, SettingKey.isAlert)),
                SettingToggleItemComponent(
                    title: S.of(context).vibration,
                    value: settingViewModel.settingModel!.isVibration,
                    onChanged: (value) =>
                        handleChangeSetting(value, SettingKey.isVibration)),
                Spacer(),
                FooterComponent(),
              ],
            ),
          ),
        ),
      );
    }
  }

  /// 子コンポーネントの設定変更ハンドラー
  void handleChangeSetting(var value, SettingKey key) {
    settingViewModel.changeModel(value, key);
  }
}
