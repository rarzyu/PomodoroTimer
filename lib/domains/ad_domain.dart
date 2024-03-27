import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// 広告Model
/// TODO: serviceを使う。modelは実装を持たない
class AdModel {
  late BannerAd bannerAd;
  InterstitialAd? interstitialAd;

  static const retryMaxCount = 3; // 最大リトライ回数
  int retryCount = 0; // リトライ回数

  var random = Random().nextInt(100); // 0~99の乱数
  static const adRate = 40; // 広告表示率

  /// initialize
  AdModel() {
    createBannerAd();
    createInterstitialAd();
  }

  /// dispose
  void dispose() {
    bannerAd.dispose();
    interstitialAd?.dispose();
  }

  /// バナー広告のユニットID
  String get bannerAdUnitId {
    bool isDebug = false;
    assert(isDebug = true);

    if (Platform.isAndroid) {
      return isDebug
          ? dotenv.env['ADMOB_BANNER_ID_ANDROID_TEST'] ?? ''
          : dotenv.env['ADMOB_BANNER_ID_ANDROID'] ?? '';
    } else if (Platform.isIOS) {
      return isDebug
          ? dotenv.env['ADMOB_BANNER_ID_IOS_TEST'] ?? ''
          : dotenv.env['ADMOB_BANNER_ID_IOS'] ?? '';
    }
    return '';
  }

  /// インタースティシャル広告のユニットID
  String get interstitialAdUnitId {
    bool isDebug = false;
    assert(isDebug = true);

    if (Platform.isAndroid) {
      return isDebug
          ? dotenv.env['ADMOB_INTERSTITIAL_ID_ANDROID_TEST'] ?? ''
          : dotenv.env['ADMOB_INTERSTITIAL_ID_ANDROID'] ?? '';
    } else if (Platform.isIOS) {
      return isDebug
          ? dotenv.env['ADMOB_INTERSTITIAL_ID_IOS_TEST'] ?? ''
          : dotenv.env['ADMOB_INTERSTITIAL_ID_IOS'] ?? '';
    }
    return '';
  }

  /// バナー広告を作成
  void createBannerAd() {
    bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          print('Banner Ad Loaded');
        },
        onAdFailedToLoad: (ad, error) {
          print('Banner Ad Failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }

  // インタースティシャル広告を作成
  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('Interstitial Ad Failed to load: $error');

          // リトライ
          if (retryCount < retryMaxCount) {
            retryCount++;
            createInterstitialAd();
          }
        },
      ),
    );
  }

  /// インタースティシャル広告を表示
  void showInterstitialAd() {
    debugPrint(interstitialAd.toString());
    if (interstitialAd != null) {
      interstitialAd!.show();
      interstitialAd = null;
      createInterstitialAd();
    } else {
      createInterstitialAd();
    }
  }

  /// ランダムな確率でインタースティシャル広告を表示
  void showInterstitialAdRandom() {
    if (random < adRate) {
      showInterstitialAd();
    }
    random = Random().nextInt(100);
  }
}
