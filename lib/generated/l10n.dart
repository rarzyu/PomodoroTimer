// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Let's get started`
  String get startTitle {
    return Intl.message(
      'Let\'s get started',
      name: 'startTitle',
      desc: '',
      args: [],
    );
  }

  /// `working state`
  String get workingTitle {
    return Intl.message(
      'working state',
      name: 'workingTitle',
      desc: '',
      args: [],
    );
  }

  /// `taking a break`
  String get breakTitle {
    return Intl.message(
      'taking a break',
      name: 'breakTitle',
      desc: '',
      args: [],
    );
  }

  /// `taking a long break`
  String get longBreakTitle {
    return Intl.message(
      'taking a long break',
      name: 'longBreakTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for all your hard work`
  String get finishMessage {
    return Intl.message(
      'Thanks for all your hard work',
      name: 'finishMessage',
      desc: '',
      args: [],
    );
  }

  /// `START`
  String get startButton {
    return Intl.message(
      'START',
      name: 'startButton',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skipButton {
    return Intl.message(
      'SKIP',
      name: 'skipButton',
      desc: '',
      args: [],
    );
  }

  /// `RESET`
  String get resetButton {
    return Intl.message(
      'RESET',
      name: 'resetButton',
      desc: '',
      args: [],
    );
  }

  /// `PAUSE`
  String get pauseButton {
    return Intl.message(
      'PAUSE',
      name: 'pauseButton',
      desc: '',
      args: [],
    );
  }

  /// `RESTART`
  String get restartButton {
    return Intl.message(
      'RESTART',
      name: 'restartButton',
      desc: '',
      args: [],
    );
  }

  /// `Working time`
  String get workingTime {
    return Intl.message(
      'Working time',
      name: 'workingTime',
      desc: '',
      args: [],
    );
  }

  /// `Break time`
  String get breakTime {
    return Intl.message(
      'Break time',
      name: 'breakTime',
      desc: '',
      args: [],
    );
  }

  /// `Long break time`
  String get longBreakTime {
    return Intl.message(
      'Long break time',
      name: 'longBreakTime',
      desc: '',
      args: [],
    );
  }

  /// `Number of repetitions until long break`
  String get numberOfRepeatUntilLongBreak {
    return Intl.message(
      'Number of repetitions until long break',
      name: 'numberOfRepeatUntilLongBreak',
      desc: '',
      args: [],
    );
  }

  /// `Number of sets`
  String get numberOfSets {
    return Intl.message(
      'Number of sets',
      name: 'numberOfSets',
      desc: '',
      args: [],
    );
  }

  /// `Vibration`
  String get vibration {
    return Intl.message(
      'Vibration',
      name: 'vibration',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
