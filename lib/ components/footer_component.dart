import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pomodoro_timer/controllers/ad_controller.dart';
import 'package:pomodoro_timer/controllers/footer_controller.dart';
import 'package:pomodoro_timer/utils/navigate_util.dart';

/// 共通フッター
/// - 画面遷移と広告の表示を行う
class FooterComponent extends StatelessWidget {
  final AdController adController = AdController();
  final FooterController footerController = FooterController();

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
    if (adController.bannerAd != null) {
      return Container(
        alignment: Alignment.center,
        child: AdWidget(ad: adController.bannerAd),
        width: adController.bannerAd.size.width.toDouble(),
        height: adController.bannerAd.size.height.toDouble(),
      );
    } else {
      return Container();
    }
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
        footerController.navigateTo(context, "/");
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
        footerController.navigateTo(context, "/setting");
      },
    );
  }
}
