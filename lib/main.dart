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
  runApp(const ProviderScope(child: MyApp()));
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
    );
  }
}
