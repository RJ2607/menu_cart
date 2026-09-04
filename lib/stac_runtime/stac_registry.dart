import 'package:dio/dio.dart';
import 'package:menu_cart/menu_cart.dart';
import 'package:stac/stac.dart';

import 'actions/cart/add_to_cart/st_add_to_cart_action_parser.dart';
import 'actions/cart/set_category/st_set_category_action_parser.dart';
import 'actions/cart/toggle_favorite/st_toggle_favorite_action_parser.dart';
import 'actions/cart/update_cart_quantity/st_update_cart_quantity_action_parser.dart';
import 'widgets/cart/st_addon_selector/st_addon_selector_parser.dart';
import 'widgets/cart/st_cart_badge/st_cart_badge_parser.dart';
import 'widgets/cart/st_category_chip/st_category_chip_parser.dart';
import 'widgets/cart/st_price_display/st_price_display_parser.dart';
import 'widgets/cart/st_size_selector/st_size_selector_parser.dart';

/// Plain Dio instance — replace with your own instance/interceptors once you
/// have a backend.
final Dio _dio = Dio();

class StacParsers {
  static final List<StacParser> parsers = [
    StMainButtonParser(),
    StPageViewParser(),
    StCustomBottomBarParser(),
    StDialogParser(),
    StDismissibleParser(),
    StAnimatedContainerParser(),
    StAnimatedIconToggleParser(),
    StConditionalWidgetParser(),
    StConditionalContainerParser(),
    StMaterialParser(),
    StFutureDataParser(_dio),
    StListViewBuilderParser(_dio),
    WildcardPageParser(),
    // Cart custom widgets
    const StCartBadgeParser(),
    const StCategoryChipParser(),
    const StSizeSelectorParser(),
    const StAddonSelectorParser(),
    const StPriceDisplayParser(),
  ];

  static final List<StacActionParser> actionParsers = [
    StWildcardPageNavActionParser(),
    // Cart custom actions
    StAddToCartActionParser(),
    StSetCategoryActionParser(),
    StToggleFavoriteActionParser(),
    StUpdateCartQuantityActionParser(),
  ];
}
