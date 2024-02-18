import 'package:flutter/material.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/pages/home_page.dart';
import 'package:pomodoro_timer/pages/setting_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/utils/navigate_util.dart';

/// 共通フッター
/// - 画面遷移と広告の表示を行う
class FutterWidget extends StatelessWidget {
  /// フッター全体
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // 画面の幅
    double screenHeight = MediaQuery.of(context).size.height; // 画面の高さ

    return Container(
      child: Column(
        children: [
          AdBanner(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeIcon(context),
              Container(
                width: screenWidth * 0.3,
              ),
              SettingIcon(context),
            ],
          ),
        ],
      ),
    );
  }

  /// 広告
  Widget AdBanner() {
    return Container(
      height: 40,
      width: 300,
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('広告'),
            ],
          ),
        ],
      ),
    );
  }

  /// ホーム画面アイコン
  Widget HomeIcon(BuildContext context) {
    return NeumorphicButton(
      padding: AppDimens.footerIconPadding,
      margin: AppDimens.footerIconMargin,
      style: AppDimens.defaultNeumorphicStyle,
      child: Icon(
        Icons.access_time_filled_sharp,
        color: AppColors.baseObject,
        size: AppDimens.footerIconSize,
      ),
      onPressed: () {
        NavigateUtil.navigateToPage(context, "/");
      },
    );
  }

  /// 設定画面アイコン
  Widget SettingIcon(BuildContext context) {
    return NeumorphicButton(
      padding: AppDimens.footerIconPadding,
      margin: AppDimens.footerIconMargin,
      style: AppDimens.defaultNeumorphicStyle,
      child: Icon(
        Icons.settings,
        color: AppColors.baseObject,
        size: AppDimens.footerIconSize,
      ),
      onPressed: () {
        NavigateUtil.navigateToPage(context, "/setting");
      },
    );
  }
}
