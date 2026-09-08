import 'package:menu_cart/core/menu_data.dart';
import 'package:menu_cart/stac_runtime/actions/cart/st_add_to_cart/st_add_to_cart_action.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_addon_selector/st_addon_selector.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_item_selection_wrapper/st_item_selection_wrapper.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_price_display/st_price_display.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_size_selector/st_size_selector.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/animated_icon_toggle/st_animated_icon_toggle.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/main_button/st_main_button.dart';
import 'package:menu_cart/stac_runtime/widgets/layout/conditional/st_conditional_widget.dart';
import 'package:stac/stac_core.dart';

/// Item detail screen - STATEFUL version with reactive selections
@StacScreen(screenName: 'item_detail')
StacWidget itemDetailScreen() {
  const stateKey = 'item_detail_main';

  return StacScaffold(
    backgroundColor: StacColors.white,
    body: StItemSelectionWrapper(
      stateKey: stateKey,
      initialSize: 'Regular',
      initialAddons: const ['Extra Cheese'],
      child: StacSingleChildScrollView(
        child: StacColumn(
          crossAxisAlignment: StacCrossAxisAlignment.start,
          children: [
            // Hero image with back button
            StacStack(
              children: [
                // Item image
                StacContainer(
                  height: 300,
                  decoration: StacBoxDecoration(color: surfaceColor),
                  child: StacImage.network(
                    '{{imageUrl}}',
                    fit: StacBoxFit.cover,
                  ),
                ),
                // Gradient overlay for better button visibility
                StacContainer(
                  height: 300,
                  decoration: StacBoxDecoration(
                    gradient: StacLinearGradient(
                      colors: [
                        StacColors.black.withOpacity(0.3),
                        StacColors.transparent,
                      ],
                      begin: StacAlignment.topCenter,
                      end: StacAlignment.bottomCenter,
                    ),
                  ),
                ),
                // Back button
                StacPositioned(
                  top: 44,
                  left: 16,
                  child: StacGestureDetector(
                    onTap: StacNavigator.pop(),
                    child: StacContainer(
                      padding: const StacEdgeInsets.all(8),
                      decoration: const StacBoxDecoration(
                        color: StacColors.white,
                        shape: StacBoxShape.circle,
                      ),
                      child: StacIcon(
                        icon: StacIcons.arrow_back_ios,
                        color: textPrimary,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                // Favorite toggle button
                StacPositioned(
                  top: 44,
                  right: 16,
                  child: StacContainer(
                    padding: const StacEdgeInsets.all(8),
                    decoration: const StacBoxDecoration(
                      color: StacColors.white,
                      shape: StacBoxShape.circle,
                    ),
                    child: StAnimatedIconToggle(
                      when: false,
                      trueIcon: 'favorite',
                      falseIcon: 'favorite_border',
                      trueColor: primaryColor,
                      falseColor: textSecondary,
                      size: 24,
                      durationMs: 200,
                    ),
                  ),
                ),
              ],
            ),

            // Item details
            StacPadding(
              padding: const StacEdgeInsets.all(20),
              child: StacColumn(
                crossAxisAlignment: StacCrossAxisAlignment.start,
                children: [
                  // Name and badges
                  StacRow(
                    children: [
                      StacExpanded(
                        child: StacText(
                          data: '{{name}}',
                          style: StacTextStyle(
                            fontSize: 26,
                            fontWeight: StacFontWeight.w700,
                            color: textPrimary,
                          ),
                        ),
                      ),
                      StConditionalWidget(
                        when: '{{isVegetarian}}',
                        whenTrue: StacContainer(
                          padding: const StacEdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: StacBoxDecoration(
                            color: '#4CAF50',
                            borderRadius: StacBorderRadius.circular(6),
                          ),
                          child: StacText(
                            data: '🌱 Veggie',
                            style: StacTextStyle(
                              fontSize: 12,
                              color: StacColors.white,
                              fontWeight: StacFontWeight.w600,
                            ),
                          ),
                        ),
                        whenFalse: const StacSizedBox(height: 0, width: 0),
                      ),
                    ],
                  ),

                  const StacSizedBox(height: 8),

                  // Description
                  StacText(
                    data: '{{description}}',
                    style: StacTextStyle(
                      fontSize: 16,
                      color: textSecondary,
                      height: 1.5,
                    ),
                  ),

                  const StacSizedBox(height: 8),

                  // STATEFUL PRICE - updates dynamically
                  StPriceDisplay(
                    stateKey: stateKey,
                    basePrice: '{{price}}',
                    sizePrices: const {'Regular': 0.0, 'Large': 2.5},
                    addonPrices: const {
                      'Extra Cheese': 1.5,
                      'Bacon': 2.0,
                      'Avocado': 2.5,
                    },
                  ),

                  const StacSizedBox(height: 24),

                  // Size selection - STATEFUL
                  StacText(
                    data: 'Choose Size',
                    style: StacTextStyle(
                      fontSize: 18,
                      fontWeight: StacFontWeight.w600,
                      color: textPrimary,
                    ),
                  ),

                  const StacSizedBox(height: 12),

                  // STATEFUL SIZE SELECTOR
                  StSizeSelector(
                    stateKey: stateKey,
                    options: sizeOptions,
                    initialValue: 'Regular',
                  ),

                  const StacSizedBox(height: 24),

                  // Add-ons - STATEFUL
                  StacText(
                    data: 'Add-Ons',
                    style: StacTextStyle(
                      fontSize: 15,
                      fontWeight: StacFontWeight.w600,
                      color: textPrimary,
                    ),
                  ),

                  const StacSizedBox(height: 12),

                  // STATEFUL ADDON SELECTOR
                  StAddonSelector(
                    stateKey: stateKey,
                    options: addonOptions,
                    initialSelected: const ['Extra Cheese'],
                  ),

                  const StacSizedBox(height: 32),

                  // Add to cart button - adds item with selections and navigates to cart
                  StMainButton(
                    title: 'Add to Cart',
                    onPressed: StAddToCartAction(
                      stateKey: stateKey,
                      itemId: '{{id}}',
                      itemName: '{{name}}',
                      itemImageUrl: '{{imageUrl}}',
                      itemBasePrice: '{{price}}',
                    ),
                  ),

                  const StacSizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
