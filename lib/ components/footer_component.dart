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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
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
          AdBanner(),
          Padding(padding: EdgeInsets.only(bottom: screenHeight * 0.03)),
        ],
      ),
    );
  }

  /// 広告
  Widget AdBanner() {
    return Container(
      alignment: Alignment.center,
      width: footerViewModel.bannerAd.size.width.toDouble(),
      height: footerViewModel.bannerAd.size.height.toDouble(),
      child: AdWidget(ad: footerViewModel.bannerAd),
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
