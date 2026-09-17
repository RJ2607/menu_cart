import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AppUrls {
  static String backendUrl = 'http://192.168.1.17:8080';

  static String get stacBaseUrl {
    const devBaseUrl = String.fromEnvironment('STAC_DEV_BASE_URL');

    if (kDebugMode && devBaseUrl.isNotEmpty) {
      return devBaseUrl;
    }
    if (Get.testMode) {
      return 'https://laptop-in1qev1s.tail2b3cd1.ts.net';
    }
    return backendUrl;
  }
}
