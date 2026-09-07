import 'package:menu_cart/stac_runtime/widgets/cart/dynamic_cart_list/st_dynamic_cart_list.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/dynamic_cart_summary/st_dynamic_cart_summary.dart';
import 'package:stac/stac_core.dart';

import 'menu_data.dart';

/// Cart screen - DYNAMIC Stac version with reactive state management
/// All cart operations (add, remove, update quantity) are fully functional
/// and reactive via CartController
@StacScreen(screenName: 'cart')
StacWidget cartScreen() {
  return StacScaffold(
    backgroundColor: surfaceColor,
    appBar: StacAppBar(
      backgroundColor: StacColors.white,
      elevation: 0,
      leading: StacIconButton(
        icon: StacIcon(icon: StacIcons.arrow_back_ios, color: textPrimary),
        onPressed: StacNavigator.pop(),
      ),
      title: StacText(
        data: 'Your Cart',
        style: StacTextStyle(
          fontSize: 20,
          fontWeight: StacFontWeight.w700,
          color: textPrimary,
        ),
      ),
    ),
    body: StacColumn(
      children: [
        // DYNAMIC cart items list - reactive to CartController
        StacExpanded(
          child: StacSingleChildScrollView(
            child: StacPadding(
              padding: const StacEdgeInsets.all(16),
              child: const DynamicCartList(),
            ),
          ),
        ),

        // DYNAMIC order summary - reactive to CartController
        const DynamicCartSummary(),
      ],
    ),
  );
}
