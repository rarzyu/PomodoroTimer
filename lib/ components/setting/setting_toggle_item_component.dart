import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// 設定画面のトグル項目
class SettingToggleItemComponent extends StatefulWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged; // 値変更時のコールバック

  const SettingToggleItemComponent({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  _SettingToggleItemState createState() => _SettingToggleItemState();
}

class _SettingToggleItemState extends State<SettingToggleItemComponent> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double fontsize =
        (AppDimens.baseSettingTextSize / AppDimens.baseScreenHeight) *
            screenHeight;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.015, horizontal: screenWidth * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: screenWidth * 0.05),
          itemLabel(context, widget.title, fontsize),
          Container(width: screenWidth * 0.18),
          toggleSwitch(context),
        ],
      ),
    );
  }

  /// 項目ラベル
  Widget itemLabel(BuildContext context, String title, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.45,
      child: Text(
        title,
        style: AppDimens.baseTextStyle.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }

  /// トグルスイッチ
  Widget toggleSwitch(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.04,
      child: NeumorphicSwitch(
          style: NeumorphicSwitchStyle(
            thumbDepth: 2,
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.grey,
          ),
          value: _currentValue,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
            widget.onChanged(value);
          }),
    );
  }
}
