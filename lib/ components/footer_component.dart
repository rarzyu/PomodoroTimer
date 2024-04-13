import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/view_models/footer_view_model.dart';

/// 共通フッター
/// - 画面遷移と広告の表示を行う
class FooterComponent extends StatelessWidget {
  final FooterViewModel footerViewModel = FooterViewModel();
    
  // アイコンサイズ
  static const double iconSize = 40;
  // アイコンマージン
  static const EdgeInsets iconMargin = EdgeInsets.all(20);
  // アイコンパディング
  static const EdgeInsets iconPadding = EdgeInsets.all(10);

  /// フッター全体
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // 画面の幅

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
      alignment: Alignment.center,
      child: AdWidget(ad: footerViewModel.adShowUtil.bannerAd),
      width: footerViewModel.adShowUtil.bannerAd.size.width.toDouble(),
      height: footerViewModel.adShowUtil.bannerAd.size.height.toDouble(),
    );
  }

  /// ホーム画面アイコン
  Widget HomeIcon(BuildContext context) {
    return NeumorphicButton(
      padding: iconPadding,
      margin: iconMargin,
      style: AppDimens.defaultNeumorphicStyle,
      child: NeumorphicIcon(
        Icons.access_time_filled_sharp,
        style: NeumorphicStyle(
          color: AppColors.baseObject,
          depth: 1.5,
        ),
        size: iconSize,
      ),
      onPressed: () {
        footerViewModel.navigateTo(context, "/");
      },
    );
  }

  /// 設定画面アイコン
  Widget SettingIcon(BuildContext context) {
    return NeumorphicButton(
      padding: iconPadding,
      margin: iconMargin,
      style: AppDimens.defaultNeumorphicStyle,
      child: NeumorphicIcon(
        Icons.settings,
        style: NeumorphicStyle(
          color: AppColors.baseObject,
          depth: 1.5,
        ),
        size: iconSize,
      ),
      onPressed: () {
        footerViewModel.navigateTo(context, "/setting");
      },
    );
  }
}
