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

/// Item detail — festive layout variation (pitch: "layout" demo).
///
/// Deliberately different from the classic bare-price layout so the pitch
/// can show two SDUI layouts over the same data:
/// 1. Tall 300 hero with gradient + floating back button + floating
///    "festive savings in cart" pill overlaid at the hero base.
/// 2. Reactive festive chip under the hero (visible only when an offer is
///    applied from a festival card / wildcard "Check festive menu" CTA).
/// 3. Title + veg badge + rating/time/serves strip.
/// 4. Price summary card with total + per-item math hint.
/// 5. "Why you'll love it" bullets card.
/// 6. Size as radio-dot cards + add-ons as check-circle rows (gold selected).
/// 7. "Pairs well with" teaser + CTA + festive auto-apply note.
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
            // Tall hero with overlaid festive pill (layout variation).
            StacStack(
              children: [
                StacClipRRect(
                  borderRadius: const StacBorderRadius.only(
                    bottomLeft: 28,
                    bottomRight: 28,
                  ),
                  child: StacContainer(
                    height: 300,
                    decoration: StacBoxDecoration(color: surfaceColor),
                    child: StacImage.network(
                      '{{imageUrl}}',
                      fit: StacBoxFit.cover,
                    ),
                  ),
                ),
                StacContainer(
                  height: 300,
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
                  bottom: 16,
                  left: 20,
                  right: 20,
                  child: StacContainer(
                    padding: const StacEdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: StacBoxDecoration(
                      color: '#2D0A31',
                      borderRadius: StacBorderRadius.circular(100),
                      border: StacBorder.all(color: '#FFC93C'),
                    ),
                    child: StacText(
                      data: '🎉 Festive savings auto-apply in cart',
                      style: StacTextStyle(
                        fontSize: 13,
                        fontWeight: StacFontWeight.w700,
                        color: '#FFC93C',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Reactive festive chip — status display only (apply/remove
            // happens in the cart picker, not here).
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
                  // Name + veg badge.
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

                  // Rating / time / serves strip (layout variation).
                  StacRow(
                    children: [
                      _metaPill('⭐ 4.8', '#FFF3D6', '#4A1500'),
                      const StacSizedBox(width: 8),
                      _metaPill('⏱ 25 min', '#FFF8F3', '#7D6565'),
                      const StacSizedBox(width: 8),
                      _metaPill('🍽 Serves 1–2', '#FFF8F3', '#7D6565'),
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

                  // Price summary card with math hint.
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
                        StacRow(
                          mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                          children: [
                            StacColumn(
                              crossAxisAlignment: StacCrossAxisAlignment.start,
                              children: [
                                StacText(
                                  data: 'Total (size + add-ons)',
                                  style: StacTextStyle(
                                    fontSize: 12,
                                    fontWeight: StacFontWeight.w600,
                                    color: textSecondary,
                                  ),
                                ),
                                const StacSizedBox(height: 4),
                                StacText(
                                  data: '{{totalPriceLabel}}',
                                  style: StacTextStyle(
                                    fontSize: 28,
                                    fontWeight: StacFontWeight.w700,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            StacContainer(
                              padding: const StacEdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: StacBoxDecoration(
                                color: '#FFC93C',
                                borderRadius: StacBorderRadius.circular(100),
                              ),
                              child: StacText(
                                data: '🎉 Festive off in cart',
                                style: StacTextStyle(
                                  fontSize: 12,
                                  fontWeight: StacFontWeight.w700,
                                  color: '#4A1500',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const StacSizedBox(height: 8),
                        StacText(
                          data:
                              'Base {{priceLabel}} + size & add-ons update live. Festival % / flat savings apply on the cart subtotal.',
                          style: StacTextStyle(
                            fontSize: 12,
                            color: '#8A6A4A',
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const StacSizedBox(height: 16),

                  // "Why you'll love it" bullets (layout variation).
                  StacContainer(
                    padding: const StacEdgeInsets.all(16),
                    decoration: StacBoxDecoration(
                      color: '#FFF8E7',
                      borderRadius: StacBorderRadius.circular(16),
                      border: StacBorder.all(color: '#F0D9A8'),
                    ),
                    child: StacColumn(
                      crossAxisAlignment: StacCrossAxisAlignment.start,
                      children: [
                        StacText(
                          data: 'WHY YOU’LL LOVE IT',
                          style: StacTextStyle(
                            fontSize: 12,
                            fontWeight: StacFontWeight.w700,
                            color: '#7C1D2B',
                            letterSpacing: 1.2,
                          ),
                        ),
                        const StacSizedBox(height: 10),
                        StacText(
                          data: '• Made fresh to order with house sauces',
                          style: StacTextStyle(
                            fontSize: 14,
                            color: '#5A3220',
                            height: 1.5,
                          ),
                        ),
                        StacText(
                          data: '• Large size + add-ons built for sharing',
                          style: StacTextStyle(
                            fontSize: 14,
                            color: '#5A3220',
                            height: 1.5,
                          ),
                        ),
                        StacText(
                          data: '• Counts toward every festive min-order',
                          style: StacTextStyle(
                            fontSize: 14,
                            color: '#5A3220',
                            height: 1.5,
                          ),
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

                  StacRow(
                    children: [
                      StacExpanded(
                        child: _sizeCard(
                          stateKey: stateKey,
                          size: 'Regular',
                          priceLabel: 'Included',
                          hint: 'Classic portion',
                          when: '{{regularSelected}}',
                        ),
                      ),
                      const StacSizedBox(width: 12),
                      StacExpanded(
                        child: _sizeCard(
                          stateKey: stateKey,
                          size: 'Large',
                          priceLabel: '+₹50',
                          hint: 'Extra filling',
                          when: '{{largeSelected}}',
                        ),
                      ),
                    ],
                  ),

                  const StacSizedBox(height: 24),

                  StacText(
                    data: 'Add-Ons',
                    style: StacTextStyle(
                      fontSize: 15,
                      fontWeight: StacFontWeight.w600,
                      color: textPrimary,
                    ),
                  ),

                  const StacSizedBox(height: 12),

                  StListViewBuilder(
                    shrinkWrap: true,
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

                  const StacSizedBox(height: 16),

                  // Pairs-well-with teaser (layout variation).
                  StacContainer(
                    padding: const StacEdgeInsets.all(16),
                    decoration: StacBoxDecoration(
                      color: '#2D0A31',
                      borderRadius: StacBorderRadius.circular(16),
                    ),
                    child: StacRow(
                      children: [
                        StacText(
                          data: '🍟',
                          style: StacTextStyle(fontSize: 28),
                        ),
                        const StacSizedBox(width: 12),
                        StacExpanded(
                          child: StacColumn(
                            crossAxisAlignment: StacCrossAxisAlignment.start,
                            children: [
                              StacText(
                                data:
                                    'Pairs well with Truffle Fries + Lemonade',
                                style: StacTextStyle(
                                  color: StacColors.white,
                                  fontSize: 14,
                                  fontWeight: StacFontWeight.w700,
                                ),
                              ),
                              const StacSizedBox(height: 4),
                              StacText(
                                data:
                                    'Bundle sides & sips to hit festive minimums faster.',
                                style: StacTextStyle(
                                  color: '#E8C88A',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

StacWidget _sizeCard({
  required String stateKey,
  required String size,
  required String priceLabel,
  required String hint,
  required String when,
}) {
  return StacGestureDetector(
    onTap: StSelectItemSizeAction(stateKey: stateKey, size: size),
    child: StConditionalContainer(
      when: when,
      padding: const StacEdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decorationWhenTrue: StacBoxDecoration(
        color: primaryColor,
        borderRadius: StacBorderRadius.circular(16),
      ),
      decorationWhenFalse: StacBoxDecoration(
        color: surfaceColor,
        borderRadius: StacBorderRadius.circular(16),
        border: StacBorder.all(color: textSecondary, width: 2),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        mainAxisSize: StacMainAxisSize.min,
        children: [
          StacRow(
            children: [
              StacText(data: size),
              const StacSizedBox(width: 6),
              StacText(data: '●', style: StacTextStyle(fontSize: 10)),
            ],
          ),
          const StacSizedBox(height: 4),
          StacText(data: priceLabel),
          const StacSizedBox(height: 4),
          StacText(data: hint, style: StacTextStyle(fontSize: 12)),
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
      margin: const StacEdgeInsets.only(bottom: 10),
      padding: const StacEdgeInsets.all(16),
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
      child: StacRow(
        children: [
          StacText(data: '◉ {{emoji}}', style: StacTextStyle(fontSize: 18)),
          const StacSizedBox(width: 12),
          StacExpanded(
            child: StacColumn(
              crossAxisAlignment: StacCrossAxisAlignment.start,
              children: [
                StacText(data: '{{label}}'),
                const StacSizedBox(height: 2),
                StacText(
                  data: '{{priceLabel}} • counts to festive min',
                  style: StacTextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          StacText(data: '{{priceLabel}}'),
        ],
      ),
    ),
  );
}
