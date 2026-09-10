import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

class AppPages {
  static final List<GetPage> pages = [];

  static final Map<String, Widget Function(BuildContext)> stacPages = {
    'menu': (context) => const Stac(routeName: 'menu'),
    'item_detail': (context) => const Stac(routeName: 'item_detail'),
    'cart': (context) => const Stac(routeName: 'cart'),
    'wildcard_page': (context) => const Stac(routeName: 'wildcard_page'),
  };

  // Use Flutter pages for full functionality
}
