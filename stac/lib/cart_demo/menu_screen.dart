import 'package:menu_cart/core/menu_data.dart';
import 'package:menu_cart/stac_runtime/actions/cart/navigate_to_item_detail/st_navigate_to_item_detail_action.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/menu_item_list_builder/st_menu_item_list_builder.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_cart_badge/st_cart_badge.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_category_chip/st_category_chip.dart';
import 'package:stac/stac_core.dart';

/// Menu screen - Fully template-based with category filtering
///
/// Features:
/// 1. Category chips for filtering (All, Mains, Sides, Drinks)
/// 2. Reactive menu items list that filters by selected category
/// 3. Template-based item layout (JSON-configurable)
/// 4. Live cart badge
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
    body: StacSingleChildScrollView(
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
                          decoration: StacBoxDecoration(color: surfaceColor),
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
                            crossAxisAlignment: StacCrossAxisAlignment.start,
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
                                data: '\${{price}}',
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

          const StacSizedBox(height: 32),
        ],
      ),
    ),
  );
}
