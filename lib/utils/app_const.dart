import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class AppConst {
  /// This is Live URL
  static const String _baseUrlLive = "https://hrm.khushalikisan.com/";

  /// This is Test URL
  static const String _baseUrlTest = "https://hrm.khushalikisan.com/";

  /// This is Test URL
  // static const String _baseUrlTest = "https://hrm.khushalikisan.com/";

  // static get _baseUrl => kReleaseMode ? _baseUrlLive : _baseUrlTest;

  /// This is Test URL OLD
  // static const String _baseUrl = _baseUrlTest;

  /// Make sure you are in live server or test server by base url
  static String baseUrlApi = "https://hrm.khushalikisan.com/api/V11";
  // static String baseUrlApi = "https://hrm.khushalikisan.com/api/V11";

  static String? endPoint;
  static String? bariKoiApiKey;

  static String baseUrlLocation =
      "$endPoint$bariKoiApiKey/";

  static String bearerToken = "Bearer";


  /// Account slug
  static String officialSlug = "official";
  static String personalSlug = "personal";
  static String financialSlug = "financial";
  static String emergencySlug = "emergency";

  static String visitCancel = "cancelled";

  static String supportPolicy = "support-24-7";
  static String aboutUs = "about-us";
  static String contactUs = "contact-us";
  static String privacyPolicy = "privacy-policy";
  static String termsOfUse = "terms-of-use";

  static int approve = 1;
  static int reject = 6;

  static List<String> supportTicketsButton = [tr("open"), tr('close'), tr('all')];
}

class CustomColors {

  // final Color _mainColor = const Color(0xFF041E48);
  // 0xFF6152BE -> Check In Color
  final Color _mainColor             = const Color(0xFF295A46);
  final Color _mainDarkColor         = const Color(0xFF041113);
  final Color _secondColor           = const Color(0xFFfb412a);
  final Color _secondDarkColor       = const Color(0xFFcb3421);
  final Color _accentColor           = const Color(0xFF8C98A8);
  final Color _accentDarkColor       = const Color(0xFF9999aa);
  final Color _scaffoldColor         = const Color(0xFFFAFAFA);

  Color mainColor({double? opacity}) {
    return _mainColor.withOpacity(opacity ?? 1.0);
  }

  Color secondColor(double opacity) {
    return _secondColor.withOpacity(opacity);
  }

  Color accentColor(double opacity) {
    return _accentColor.withOpacity(opacity);
  }

  Color mainDarkColor(double opacity) {
    return _mainDarkColor.withOpacity(opacity);
  }

  Color secondDarkColor(double opacity) {
    return _secondDarkColor.withOpacity(opacity);
  }

  Color accentDarkColor(double opacity) {
    return _accentDarkColor.withOpacity(opacity);
  }

  Color scaffoldColor(double opacity) {
    // TODO test if brightness is dark or not
    return _scaffoldColor.withOpacity(opacity);
  }
}