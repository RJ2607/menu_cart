import 'package:menu_cart/stac_runtime/widgets/layout/wildcard_page/wildcard_page.dart';
import 'package:stac/stac_core.dart';

import 'festival_discount_data.dart';
import 'pages/christmas_discount_page.dart';
import 'pages/new_year_discount_page.dart';

@StacScreen(screenName: 'wildcard_page')
StacWidget festivalWildcardPage() => WildcardPage(
  children: {
    christmasDiscountPageKey: christmasDiscountPage(),
    newYearDiscountPageKey: newYearDiscountPage(),
  },
);
