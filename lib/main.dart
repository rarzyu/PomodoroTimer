import 'dart:ui' as ui;

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/constants/colors.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/pages/home_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'pages/setting_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await initAppTrackingTransparency();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initAppTrackingTransparency() async {
  // ユーザーが既にトラッキング許可を与えているか確認
  final status = await AppTrackingTransparency.trackingAuthorizationStatus;

  // 未決定の場合のみ許可を求める
  if (status == TrackingStatus.notDetermined) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // スクリーンを常にONに設定
    WakelockPlus.enable();

    return NeumorphicApp(
      routes: {
        '/home': (context) => HomePage(),
        '/setting': (context) => SettingPage(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: AppColors.mainColor,
        lightSource: LightSource.topLeft,
        depth: 1,
        intensity: 1,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        final currentLocale = ui.window.locale; // デバイスで設定されているロケールの取得
        debugPrint('current locale language=${currentLocale.languageCode} device locales=$locales supported locales=$supportedLocales');
        if (locales == null) {
          return const Locale('en', 'US');
        }
        for (var locale in supportedLocales) {
          // languageCodeで言語コードが取得できる
          // supportedLocalesと一致すればそのまま返す、それ以外は英語を返す
          if (currentLocale.languageCode == locale.languageCode) {
            return locale;
          }
        }
        return const Locale('en', 'US');
      },
    );
  }
}
