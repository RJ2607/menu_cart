import 'package:menu_cart/stac_runtime/widgets/cart/st_cart_badge/st_cart_badge.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_category_chip/st_category_chip.dart';
import 'package:stac/stac_core.dart';

import 'menu_data.dart';
import 'widgets/food_card.dart';
import 'widgets/section_header.dart';

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

          // Menu items by category - static list
          StacPadding(
            padding: const StacEdgeInsets.symmetric(horizontal: 16),
            child: StacColumn(
              crossAxisAlignment: StacCrossAxisAlignment.start,
              children: [
                // Mains section
                sectionHeader('Mains'),
                ...getItemsByCategory('Mains').map(foodCard),

                const StacSizedBox(height: 16),

                // Sides section
                sectionHeader('Sides'),
                ...getItemsByCategory('Sides').map(foodCard),

                const StacSizedBox(height: 16),

                // Drinks section
                sectionHeader('Drinks'),
                ...getItemsByCategory('Drinks').map(foodCard),

                const StacSizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
