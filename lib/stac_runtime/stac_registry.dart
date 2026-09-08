import 'package:dio/dio.dart';
import 'package:menu_cart/menu_cart.dart';
import 'package:stac/stac.dart';

import 'actions/cart/set_category/st_set_category_action_parser.dart';
import 'actions/cart/toggle_favorite/st_toggle_favorite_action_parser.dart';
import 'actions/cart/update_cart_quantity/st_update_cart_quantity_action_parser.dart';
import 'widgets/cart/cart_item_list_builder/st_cart_item_list_builder_parser.dart';
import 'widgets/cart/cart_summary_builder/st_cart_summary_builder_parser.dart';
import 'widgets/cart/filtered_menu_items/st_filtered_menu_items_parser.dart';
import 'widgets/cart/menu_item_list_builder/st_menu_item_list_builder_parser.dart';
import 'widgets/cart/st_addon_selector/st_addon_selector_parser.dart';
import 'widgets/cart/st_cart_badge/st_cart_badge_parser.dart';
import 'widgets/cart/st_category_chip/st_category_chip_parser.dart';
import 'widgets/cart/st_item_selection_wrapper/st_item_selection_wrapper_parser.dart';
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
    QuantityControlParser(),
    // Cart template-based widgets
    const StCartItemListBuilderParser(),
    const StCartSummaryBuilderParser(),
    const StMenuItemListBuilderParser(),
    // Cart custom widgets
    const StCartBadgeParser(),
    const StCategoryChipParser(),
    const FilteredMenuItemsParser(),
    const StSizeSelectorParser(),
    const StAddonSelectorParser(),
    const StPriceDisplayParser(),
    StItemSelectionWrapperParser(),
  ];

  static final List<StacActionParser> actionParsers = [
    StWildcardPageNavActionParser(),
    StPlaceOrderActionParser(),
    StNavigateToItemDetailActionParser(),
    // Cart custom actions
    StAddToCartActionParser(),
    StSetCategoryActionParser(),
    StToggleFavoriteActionParser(),
    StUpdateCartQuantityActionParser(),
  ];
}
