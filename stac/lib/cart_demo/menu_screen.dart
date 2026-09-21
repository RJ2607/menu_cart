import 'package:menu_cart/core/festive/festive_offer.dart';
import 'package:menu_cart/core/festive/festive_offers.dart';
import 'package:menu_cart/core/menu_data.dart';
import 'package:menu_cart/stac_runtime/actions/cart/navigate_to_item_detail/st_navigate_to_item_detail_action.dart';
import 'package:menu_cart/stac_runtime/actions/festive/apply_festive_offer/st_apply_festive_offer_action.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/cart_preview_bar/st_cart_preview_bar.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/menu_item_list_builder/st_menu_item_list_builder.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_cart_badge/st_cart_badge.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_category_chip/st_category_chip.dart';
import 'package:menu_cart/stac_runtime/widgets/festive/festive_offer_bar/st_festive_offer_bar.dart';
import 'package:stac/stac_core.dart';

import '../wildcard_page/festival_discount_data.dart';

String _demoExample(FestiveOffer? offer) {
  if (offer == null) return '';
  final demoSubtotal = offer.minOrderSubtotal >= 1000
      ? offer.minOrderSubtotal
      : 1000.0;
  return 'e.g. ${offer.exampleLine(demoSubtotal)}';
}

@StacScreen(screenName: 'menu')
StacWidget menuScreen() {
  return StacScaffold(
    backgroundColor: surfaceColor,
    appBar: StacAppBar(
      backgroundColor: StacColors.white,
      elevation: 0,
      title: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: brandName,
            style: StacTextStyle(
              fontSize: 22,
              fontWeight: StacFontWeight.w700,
              color: primaryColor,
            ),
          ),
          StacText(
            data: brandTagline,
            style: StacTextStyle(fontSize: 12, color: textSecondary),
          ),
        ],
      ),
      actions: [
        // STATEFUL CART BADGE - shows live count
        StacPadding(
          padding: const StacEdgeInsets.only(right: 16),
          child: StCartBadge(
            iconColor: textPrimary,
            badgeColor: primaryColor,
            iconSize: 28,
            onTap: StacNavigator.pushStac('cart'),
          ),
        ),
      ],
    ),
    body: StacStack(
      children: [
        StacSingleChildScrollView(
          child: StacColumn(
            crossAxisAlignment: StacCrossAxisAlignment.start,
            children: [
              // Promotional banner
              StacContainer(
                margin: const StacEdgeInsets.all(16),
                padding: const StacEdgeInsets.all(16),
                decoration: StacBoxDecoration(
                  gradient: StacLinearGradient(
                    colors: [primaryColor, accentColor],
                    begin: StacAlignment.centerLeft,
                    end: StacAlignment.centerRight,
                  ),
                  borderRadius: StacBorderRadius.circular(16),
                ),
                child: StacRow(
                  children: [
                    StacExpanded(
                      child: StacText(
                        data: promoText,
                        style: StacTextStyle(
                          color: StacColors.white,
                          fontSize: 15,
                          fontWeight: StacFontWeight.w600,
                        ),
                      ),
                    ),
                    const StacIcon(
                      icon: StacIcons.local_shipping,
                      color: StacColors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),

              // Active-offer banner — reactive. Shows the applied festive theme,
              // unlock progress, and code. New festivals render automatically.
              // Remove pill lets the user clear the applied offer (clear_festive_offer).
              const FestiveOfferBar(showRemoveButton: true),

              StacPadding(
                padding: const StacEdgeInsets.symmetric(horizontal: 16),
                child: StacColumn(
                  crossAxisAlignment: StacCrossAxisAlignment.start,
                  children: [
                    StacText(
                      data:
                          '🎉 Festive offers — tap a card to preview & auto-apply',
                      style: StacTextStyle(
                        fontSize: 14,
                        fontWeight: StacFontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const StacSizedBox(height: 10),
                    StacRow(
                      spacing: 12,
                      children: [
                        StacExpanded(
                          child: _festivalCard(
                            festiveKey: christmasDiscountPageKey,
                            emoji: '🎄',
                          ),
                        ),
                        StacExpanded(
                          child: _festivalCard(
                            festiveKey: newYearDiscountPageKey,
                            emoji: '🎆',
                          ),
                        ),
                        StacExpanded(
                          child: _festivalCard(
                            festiveKey: diwaliDiscountPageKey,
                            emoji: '🪔',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const StacSizedBox(height: 16),

              // STATEFUL Category chips - interactive filtering
              StacContainer(
                height: 40,
                margin: const StacEdgeInsets.only(left: 16, bottom: 16),
                child: StacSingleChildScrollView(
                  scrollDirection: StacAxis.horizontal,
                  child: StacRow(
                    children: [
                      const StCategoryChip(category: 'All'),
                      ...categories.map((cat) => StCategoryChip(category: cat)),
                    ],
                  ),
                ),
              ),

              // Menu items - REACTIVE filtered list based on selected category
              StacPadding(
                padding: const StacEdgeInsets.symmetric(horizontal: 16),
                child: StMenuItemListBuilder(
                  items: [
                    for (final item in menuItems)
                      {
                        'id': item.id,
                        'name': item.name,
                        'description': item.description,
                        'category': item.category,
                        'price': item.price,
                        'imageUrl': item.imageUrl,
                        'isVegetarian': item.isVegetarian,
                        'isAvailable': item.isAvailable,
                        'isFeatured': item.isFeatured,
                      },
                  ],
                  sectionHeaderTemplate: '{{category}}',
                  spacing: 16,
                  emptyWidget: StacCenter(
                    child: StacPadding(
                      padding: const StacEdgeInsets.all(40),
                      child: StacColumn(
                        mainAxisSize: StacMainAxisSize.min,
                        children: [
                          StacIcon(
                            icon: StacIcons.restaurant_menu,
                            size: 80,
                            color: '#636E72',
                          ),
                          const StacSizedBox(height: 16),
                          StacText(
                            data: 'No items available',
                            style: StacTextStyle(
                              fontSize: 18,
                              fontWeight: StacFontWeight.w600,
                              color: '#636E72',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Item template with {{placeholders}} for dynamic data
                  // Parser will replace {{name}}, {{price}}, {{imageUrl}}, etc.
                  itemTemplate: StacGestureDetector(
                    onTap: StNavigateToItemDetailAction(itemId: '{{id}}'),
                    child: StacContainer(
                      margin: const StacEdgeInsets.only(bottom: 16),
                      decoration: StacBoxDecoration(
                        color: cardColor,
                        borderRadius: StacBorderRadius.circular(16),
                        boxShadow: const [
                          StacBoxShadow(
                            color: '#0000000f',
                            blurRadius: 8,
                            offset: StacOffset(dx: 0, dy: 2),
                          ),
                        ],
                      ),
                      child: StacRow(
                        crossAxisAlignment: StacCrossAxisAlignment.start,
                        children: [
                          // Item image
                          StacClipRRect(
                            borderRadius: const StacBorderRadius.only(
                              topLeft: 16,
                              bottomLeft: 16,
                            ),
                            child: StacContainer(
                              width: 110,
                              height: 110,
                              decoration: StacBoxDecoration(
                                color: surfaceColor,
                              ),
                              child: StacImage.network(
                                '{{imageUrl}}',
                                fit: StacBoxFit.cover,
                              ),
                            ),
                          ),
                          // Item details
                          StacExpanded(
                            child: StacPadding(
                              padding: const StacEdgeInsets.all(12),
                              child: StacColumn(
                                crossAxisAlignment:
                                    StacCrossAxisAlignment.start,
                                mainAxisAlignment:
                                    StacMainAxisAlignment.spaceBetween,
                                children: [
                                  StacColumn(
                                    crossAxisAlignment:
                                        StacCrossAxisAlignment.start,
                                    children: [
                                      // Name
                                      StacText(
                                        data: '{{name}}',
                                        style: StacTextStyle(
                                          fontSize: 16,
                                          fontWeight: StacFontWeight.w600,
                                          color: textPrimary,
                                        ),
                                        maxLines: 1,
                                        overflow: StacTextOverflow.ellipsis,
                                      ),
                                      const StacSizedBox(height: 4),
                                      // Description
                                      StacText(
                                        data: '{{description}}',
                                        style: StacTextStyle(
                                          fontSize: 13,
                                          color: textSecondary,
                                        ),
                                        maxLines: 2,
                                        overflow: StacTextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const StacSizedBox(height: 8),
                                  // Price
                                  StacText(
                                    data: '₹{{price}}',
                                    style: StacTextStyle(
                                      fontSize: 18,
                                      fontWeight: StacFontWeight.w700,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Spacer so the last card scrolls clear of the floating bar.
              const StacSizedBox(height: 96),
            ],
          ),
        ),
        // Floating cart preview — full width with 20 horizontal padding.
        // Hidden while the cart is empty; tap navigates to the cart page.
        const StacPositioned(
          left: 20,
          right: 20,
          bottom: 16,
          child: StCartPreviewBar(),
        ),
      ],
    ),
  );
}

StacWidget _festivalCard({required String festiveKey, required String emoji}) {
  // Registry-driven: badge, code, min-order, theme + accent all come from
  // `festiveOffers[festiveKey]`, so a future festival renders correctly with
  // zero changes here. Tapping applies the offer AND opens its wildcard
  // page for the full thematic takeover (cart + checkout follow).
  final offer = festiveOffers[festiveKey];
  final title = offer?.name ?? festiveKey;
  final discount = offer?.badgeLabel ?? '';
  final code = offer?.code ?? '';
  final color = offer?.themeColor ?? '#2D3436';
  final discountColor = offer?.accentColor ?? '#FFFFFF';
  final minLabel =
      'Min. ${offer?.currencySymbol ?? '₹'}${((offer?.minOrderSubtotal ?? 0) % 1 == 0) ? (offer?.minOrderSubtotal ?? 0).toInt().toString() : (offer?.minOrderSubtotal ?? 0).toString()}';

  return StacGestureDetector(
    // Thematic takeover: tapping applies the festive offer (cart, offer bar,
    // checkout all follow) AND opens its wildcard page.
    onTap: StApplyFestiveOfferAction(
      festiveKey: festiveKey,
      openWildcardPage: festiveKey,
    ),
    child: StacContainer(
      padding: const StacEdgeInsets.all(14),
      decoration: StacBoxDecoration(
        color: color,
        borderRadius: StacBorderRadius.circular(16),
        border: StacBorder.all(color: discountColor),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(data: emoji, style: StacTextStyle(fontSize: 22)),
          const StacSizedBox(height: 6),
          StacText(
            data: title,
            style: StacTextStyle(
              color: StacColors.white,
              fontSize: 14,
              fontWeight: StacFontWeight.w600,
            ),
          ),
          const StacSizedBox(height: 6),
          StacText(
            data: discount,
            style: StacTextStyle(
              color: discountColor,
              fontSize: 20,
              fontWeight: StacFontWeight.w700,
            ),
          ),
          const StacSizedBox(height: 8),
          StacContainer(
            padding: const StacEdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: StacBoxDecoration(
              color: '#33FFFFFF',
              borderRadius: StacBorderRadius.circular(100),
            ),
            child: StacText(
              data: minLabel,
              style: StacTextStyle(
                color: StacColors.white,
                fontSize: 11,
                fontWeight: StacFontWeight.w700,
              ),
            ),
          ),
          const StacSizedBox(height: 6),
          StacText(
            data: '$code • Tap to view',
            style: StacTextStyle(color: '#FFFFFF', fontSize: 11),
          ),
          const StacSizedBox(height: 4),
          StacText(
            data: _demoExample(offer),
            style: StacTextStyle(
              color: discountColor,
              fontSize: 11,
              fontWeight: StacFontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}
