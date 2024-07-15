import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/constants/dimens.dart';
import 'package:pomodoro_timer/view_models/footer_view_model.dart';

/// 共通フッター
/// - 画面遷移と広告の表示を行う
class FooterComponent extends StatefulWidget {
  @override
  _FooterComponent createState() => _FooterComponent();
}

class _FooterComponent extends State<FooterComponent>
    with WidgetsBindingObserver {
  final FooterViewModel footerViewModel = FooterViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      debugPrint("フォアグラウンド：footer_component");
      footerViewModel.createBannerAd();
    } else if (state == AppLifecycleState.paused) {
      debugPrint("バックグラウンド：footer_component");
    }
  }

  /// フッター全体
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double iconSize =
        (AppDimens.baseIconSize / AppDimens.baseScreenHeight) * screenHeight;

    EdgeInsets iconMargine = EdgeInsets.all(screenWidth * 0.05);
    EdgeInsets iconPadding = EdgeInsets.all(screenWidth * 0.025);

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeIcon(context, iconSize, iconMargine, iconPadding),
              Container(
                width: screenWidth * 0.25,
              ),
              SettingIcon(context, iconSize, iconMargine, iconPadding),
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
  Widget HomeIcon(BuildContext context, double iconSize, EdgeInsets iconMargin,
      EdgeInsets iconPadding) {
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
  Widget SettingIcon(BuildContext context, double iconSize,
      EdgeInsets iconMargin, EdgeInsets iconPadding) {
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
