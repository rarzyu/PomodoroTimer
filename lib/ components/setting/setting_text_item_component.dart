import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/constants/dimens.dart';

/// 設定画面のテキスト項目
class SettingTextItemComponent extends StatefulWidget {
  final String title;
  final int value;
  final Function(int) onChanged; // 値変更時のコールバック
  final int maxLength;

  SettingTextItemComponent({
    required this.title,
    required this.value,
    required this.onChanged,
    required this.maxLength,
  });

  @override
  _SettingTextItemComponentState createState() =>
      _SettingTextItemComponentState();
}

class _SettingTextItemComponentState extends State<SettingTextItemComponent> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: screenWidth * 0.05),
          itemLabel(context, widget.title),
          Container(width: screenWidth * 0.1),
          textField(context),
        ],
      ),
    );
  }

  /// 項目ラベル
  Widget itemLabel(BuildContext context, String title) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.45,
      child: Text(
        title,
        style: AppDimens.baseTextStyle.copyWith(
          fontSize: AppDimens.settingItemTextSize,
        ),
      ),
    );
  }

  /// テキストフィールド
  Widget textField(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.25,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -5,
          boxShape: NeumorphicBoxShape.rect(),
        ),
        child: TextField(
          controller: _controller,
          onChanged: (value) =>
              widget.onChanged(value.isEmpty ? 0 : int.parse(value)),
          textAlign: TextAlign.center,
          maxLines: 1,
          maxLength: widget.maxLength,
          keyboardType: TextInputType.number,
          style: AppDimens.baseTextStyle.copyWith(
            fontSize: AppDimens.settingItemTextSize,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
        ),
      ),
    );
  }
}
