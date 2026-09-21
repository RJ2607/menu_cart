import 'package:menu_cart/core/menu_data.dart';
import 'package:menu_cart/stac_runtime/actions/cart/select_item_size/st_select_item_size_action.dart';
import 'package:menu_cart/stac_runtime/actions/cart/st_add_to_cart/st_add_to_cart_action.dart';
import 'package:menu_cart/stac_runtime/actions/cart/toggle_item_addon/st_toggle_item_addon_action.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_item_selection_wrapper/st_item_selection_wrapper.dart';
import 'package:menu_cart/stac_runtime/widgets/collections/list_view_builder/st_list_view_builder.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/main_button/st_main_button.dart';
import 'package:menu_cart/stac_runtime/widgets/festive/festive_offer_bar/st_festive_offer_bar.dart';
import 'package:menu_cart/stac_runtime/widgets/layout/conditional/st_conditional_widget.dart';
import 'package:menu_cart/stac_runtime/widgets/layout/conditional_container/st_conditional_container.dart';
import 'package:stac/stac_core.dart';

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
            StacStack(
              children: [
                StacClipRRect(
                  borderRadius: const StacBorderRadius.only(
                    bottomLeft: 28,
                    bottomRight: 28,
                  ),
                  child: StacContainer(
                    height: 260,
                    decoration: StacBoxDecoration(color: surfaceColor),
                    child: StacImage.network(
                      '{{imageUrl}}',
                      fit: StacBoxFit.cover,
                    ),
                  ),
                ),
                StacContainer(
                  height: 260,
                  decoration: StacBoxDecoration(
                    gradient: StacLinearGradient(
                      colors: [
                        StacColors.black.withOpacity(0.35),
                        StacColors.transparent,
                      ],
                      begin: StacAlignment.topCenter,
                      end: StacAlignment.bottomCenter,
                    ),
                  ),
                ),
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
                StacPositioned(
                  top: 48,
                  right: 16,
                  child: StacContainer(
                    padding: const StacEdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: StacBoxDecoration(
                      color: '#2D0A31',
                      borderRadius: StacBorderRadius.circular(100),
                      border: StacBorder.all(color: '#FFC93C'),
                    ),
                    child: StacText(
                      data: '⭐ 4.8 • 2k ratings',
                      style: StacTextStyle(
                        fontSize: 12,
                        fontWeight: StacFontWeight.w700,
                        color: '#FFC93C',
                      ),
                    ),
                  ),
                ),
                StacPositioned(
                  bottom: 16,
                  left: 20,
                  child: StacContainer(
                    padding: const StacEdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: StacBoxDecoration(
                      color: '#FFC93C',
                      borderRadius: StacBorderRadius.circular(100),
                    ),
                    child: StacText(
                      data: '🔥 Bestseller',
                      style: StacTextStyle(
                        fontSize: 12,
                        fontWeight: StacFontWeight.w700,
                        color: '#4A1500',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const FestiveOfferBar(showWhenNone: false, compact: true),

            StacPadding(
              padding: const StacEdgeInsets.only(
                left: 20,
                top: 8,
                right: 20,
                bottom: 20,
              ),
              child: StacColumn(
                crossAxisAlignment: StacCrossAxisAlignment.start,
                children: [
                  StacRow(
                    crossAxisAlignment: StacCrossAxisAlignment.start,
                    children: [
                      StacExpanded(
                        child: StacColumn(
                          crossAxisAlignment: StacCrossAxisAlignment.start,
                          children: [
                            StacText(
                              data: '{{name}}',
                              style: StacTextStyle(
                                fontSize: 24,
                                fontWeight: StacFontWeight.w700,
                                color: textPrimary,
                              ),
                            ),
                            const StacSizedBox(height: 4),
                            StConditionalWidget(
                              when: '{{isVegetarian}}',
                              whenTrue: StacText(
                                data: '🌱 Vegetarian • made fresh',
                                style: StacTextStyle(
                                  fontSize: 13,
                                  color: '#2E7D32',
                                  fontWeight: StacFontWeight.w600,
                                ),
                              ),
                              whenFalse: StacText(
                                data: '🍗 Non-veg • made fresh',
                                style: StacTextStyle(
                                  fontSize: 13,
                                  color: '#7D6565',
                                  fontWeight: StacFontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const StacSizedBox(width: 12),
                      StacColumn(
                        crossAxisAlignment: StacCrossAxisAlignment.end,
                        children: [
                          StacText(
                            data: '{{totalPriceLabel}}',
                            style: StacTextStyle(
                              fontSize: 24,
                              fontWeight: StacFontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                          StacText(
                            data: 'incl. size + add-ons',
                            style: StacTextStyle(
                              fontSize: 11,
                              color: textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const StacSizedBox(height: 10),
                  StacRow(
                    children: [
                      _metaPill('⏱ 25 min', '#FFF8F3', '#7D6565'),
                      const StacSizedBox(width: 8),
                      _metaPill('🍽 Serves 1–2', '#FFF8F3', '#7D6565'),
                      const StacSizedBox(width: 8),
                      _metaPill('🎉 Festive off in cart', '#FFF3D6', '#4A1500'),
                    ],
                  ),

                  const StacSizedBox(height: 10),

                  StacText(
                    data: '{{description}}',
                    style: StacTextStyle(
                      fontSize: 16,
                      color: textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const StacSizedBox(height: 16),
                  StacContainer(
                    padding: const StacEdgeInsets.all(16),
                    decoration: StacBoxDecoration(
                      color: surfaceColor,
                      borderRadius: StacBorderRadius.circular(16),
                      border: StacBorder.all(color: '#F0D9A8'),
                    ),
                    child: StacColumn(
                      crossAxisAlignment: StacCrossAxisAlignment.start,
                      children: [
                        StacText(
                          data: 'BILL PREVIEW',
                          style: StacTextStyle(
                            fontSize: 12,
                            fontWeight: StacFontWeight.w700,
                            color: '#7C1D2B',
                            letterSpacing: 1.2,
                          ),
                        ),
                        const StacSizedBox(height: 10),
                        StacRow(
                          mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                          children: [
                            StacText(
                              data: 'Base price',
                              style: StacTextStyle(
                                fontSize: 14,
                                color: textSecondary,
                              ),
                            ),
                            StacText(
                              data: '{{totalPriceLabel}}',
                              style: StacTextStyle(
                                fontSize: 14,
                                fontWeight: StacFontWeight.w600,
                                color: textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const StacSizedBox(height: 6),
                        StacRow(
                          mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                          children: [
                            StacText(
                              data: 'With size + add-ons',
                              style: StacTextStyle(
                                fontSize: 14,
                                color: textSecondary,
                              ),
                            ),
                            StacText(
                              data: '{{variablePrice}}',
                              style: StacTextStyle(
                                fontSize: 16,
                                fontWeight: StacFontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const StacSizedBox(height: 6),
                        StacRow(
                          mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                          children: [
                            StacText(
                              data: 'Festive savings',
                              style: StacTextStyle(
                                fontSize: 14,
                                color: textSecondary,
                              ),
                            ),
                            StacText(
                              data: '− auto in cart 🎉',
                              style: StacTextStyle(
                                fontSize: 14,
                                fontWeight: StacFontWeight.w700,
                                color: '#1E8E3E',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const StacSizedBox(height: 24),
                  StacText(
                    data: 'Choose Size',
                    style: StacTextStyle(
                      fontSize: 18,
                      fontWeight: StacFontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const StacSizedBox(height: 12),
                  StacContainer(
                    padding: const StacEdgeInsets.all(4),
                    decoration: StacBoxDecoration(
                      color: surfaceColor,
                      borderRadius: StacBorderRadius.circular(100),
                      border: StacBorder.all(color: '#E5DCCB'),
                    ),
                    child: StacRow(
                      children: [
                        StacExpanded(
                          child: _sizeSegment(
                            stateKey: stateKey,
                            size: 'Regular',
                            priceLabel: 'Included',
                            when: '{{regularSelected}}',
                          ),
                        ),
                        StacExpanded(
                          child: _sizeSegment(
                            stateKey: stateKey,
                            size: 'Large',
                            priceLabel: '+₹50',
                            when: '{{largeSelected}}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const StacSizedBox(height: 16),
                  StacText(
                    data: 'Add-Ons',
                    style: StacTextStyle(
                      fontSize: 15,
                      fontWeight: StacFontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const StacSizedBox(height: 12),
                  StacContainer(
                    height: 150,
                    child: StListViewBuilder(
                      shrinkWrap: true,
                      scrollDirection: 'horizontal',
                      items: const [
                        {
                          'label': 'Extra Cheese',
                          'priceLabel': '+₹30',
                          'emoji': '🧀',
                          'selected': '{{extraCheeseSelected}}',
                        },
                        {
                          'label': 'Bacon',
                          'priceLabel': '+₹40',
                          'emoji': '🥓',
                          'selected': '{{baconSelected}}',
                        },
                        {
                          'label': 'Avocado',
                          'priceLabel': '+₹50',
                          'emoji': '🥑',
                          'selected': '{{avocadoSelected}}',
                        },
                      ],
                      itemTemplate: _addonOptionTemplate(stateKey),
                    ),
                  ),
                  const StacSizedBox(height: 24),
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
                  const StacSizedBox(height: 12),
                  StacContainer(
                    padding: const StacEdgeInsets.all(14),
                    decoration: StacBoxDecoration(
                      color: '#FFF8E7',
                      borderRadius: StacBorderRadius.circular(14),
                      border: StacBorder.all(color: '#F0D9A8'),
                    ),
                    child: StacText(
                      data:
                          '🎉 Applied festive offers auto-calculate in your cart — check the green discount row before checkout.',
                      style: StacTextStyle(fontSize: 13, color: '#8A6A4A'),
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

StacWidget _metaPill(String label, String bg, String fg) {
  return StacContainer(
    padding: const StacEdgeInsets.symmetric(horizontal: 12, vertical: 7),
    decoration: StacBoxDecoration(
      color: bg,
      borderRadius: StacBorderRadius.circular(100),
      border: StacBorder.all(color: '#F0D9A8'),
    ),
    child: StacText(
      data: label,
      style: StacTextStyle(
        fontSize: 12,
        fontWeight: StacFontWeight.w700,
        color: fg,
      ),
    ),
  );
}

StacWidget _sizeSegment({
  required String stateKey,
  required String size,
  required String priceLabel,
  required String when,
}) {
  return StacGestureDetector(
    onTap: StSelectItemSizeAction(stateKey: stateKey, size: size),
    child: StConditionalContainer(
      when: when,
      padding: const StacEdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decorationWhenTrue: StacBoxDecoration(
        color: primaryColor,
        borderRadius: StacBorderRadius.circular(100),
      ),
      decorationWhenFalse: StacBoxDecoration(
        color: StacColors.transparent,
        borderRadius: StacBorderRadius.circular(100),
      ),
      child: StacColumn(
        mainAxisSize: StacMainAxisSize.min,
        children: [
          StacText(data: size),
          const StacSizedBox(height: 2),
          StacText(data: priceLabel, style: StacTextStyle(fontSize: 12)),
        ],
      ),
    ),
  );
}

StacWidget _addonOptionTemplate(String stateKey) {
  return StacGestureDetector(
    onTap: StToggleItemAddonAction(stateKey: stateKey, addon: '{{label}}'),
    child: StConditionalContainer(
      when: '{{selected}}',
      width: 116,
      margin: const StacEdgeInsets.only(right: 10),
      padding: const StacEdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decorationWhenTrue: StacBoxDecoration(
        color: '#FFF3D6',
        borderRadius: StacBorderRadius.circular(14),
        border: StacBorder.all(color: '#FFC93C', width: 2),
      ),
      decorationWhenFalse: StacBoxDecoration(
        color: surfaceColor,
        borderRadius: StacBorderRadius.circular(14),
        border: StacBorder.all(color: '#E5DCCB', width: 1),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.center,
        mainAxisSize: StacMainAxisSize.min,
        children: [
          StacText(data: '{{emoji}}', style: StacTextStyle(fontSize: 26)),
          const StacSizedBox(height: 6),
          StacText(
            data: '{{label}}',
            textAlign: StacTextAlign.center,
            style: StacTextStyle(
              fontSize: 12,
              fontWeight: StacFontWeight.w600,
              color: textPrimary,
            ),
            maxLines: 1,
            overflow: StacTextOverflow.ellipsis,
          ),
          const StacSizedBox(height: 2),
          StacText(
            data: '{{priceLabel}}',
            textAlign: StacTextAlign.center,
            style: StacTextStyle(fontSize: 12, color: textSecondary),
          ),
          const StacSizedBox(height: 8),
          StConditionalWidget(
            when: '{{selected}}',
            whenTrue: StacContainer(
              padding: const StacEdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: StacBoxDecoration(
                color: '#1E8E3E',
                borderRadius: StacBorderRadius.circular(100),
              ),
              child: StacText(
                data: 'ON',
                style: StacTextStyle(
                  fontSize: 10,
                  fontWeight: StacFontWeight.w700,
                  color: StacColors.white,
                ),
              ),
            ),
            whenFalse: StacContainer(
              padding: const StacEdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: StacBoxDecoration(
                color: '#E5DCCB',
                borderRadius: StacBorderRadius.circular(100),
              ),
              child: StacText(
                data: 'OFF',
                style: StacTextStyle(
                  fontSize: 10,
                  fontWeight: StacFontWeight.w700,
                  color: '#7D6565',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
