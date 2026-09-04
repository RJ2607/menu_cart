import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stac/stac.dart';

import '../features/cart/screens/cart_page.dart';
import '../features/menu/screens/item_detail_page.dart';
import '../features/menu/screens/menu_page.dart';

class AppPages {
  static final List<GetPage> pages = [];

  static final Map<String, Widget Function(BuildContext)> stacPages = {
    'menu': (context) => const Stac(routeName: 'menu'),
    'item_detail': (context) => const Stac(routeName: 'item_detail'),
    'cart': (context) => const Stac(routeName: 'cart'),
  };

  // Use Flutter pages for full functionality
  static final List<GetPage> flutterPages = [
    GetPage(
      name: '/menu',
      page: () => const MenuScreen(),
    ),
    GetPage(
      name: '/item_detail',
      page: () => const ItemDetailScreen(),
    ),
    GetPage(
      name: '/cart',
      page: () => const CartScreen(),
    ),
  ];
}
