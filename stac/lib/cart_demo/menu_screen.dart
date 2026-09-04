import 'package:stac/stac_core.dart';
import 'menu_data.dart';
import 'widgets/food_card.dart';
import 'widgets/section_header.dart';

@StacScreen(screenName: 'menu')
StacWidget menuScreen() {
  // Note: This is a static screen. For dynamic cart count, 
  // implement a custom Stac widget parser or use Flutter screen
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
            style: StacTextStyle(
              fontSize: 12,
              color: textSecondary,
            ),
          ),
        ],
      ),
      actions: [
        // Cart button - shows static count
        // For dynamic count, use a Flutter screen instead of Stac
        StacPadding(
          padding: const StacEdgeInsets.only(right: 16),
          child: StacGestureDetector(
            onTap: StacNavigator.pushStac('cart'),
            child: StacStack(
              children: [
                StacPadding(
                  padding: const StacEdgeInsets.all(8),
                  child: StacIcon(
                    icon: StacIcons.shopping_cart,
                    color: textPrimary,
                    size: 28,
                  ),
                ),
                // Static badge - will show 0
                StacPositioned(
                  right: 4,
                  top: 4,
                  child: StacContainer(
                    padding: const StacEdgeInsets.all(4),
                    decoration: StacBoxDecoration(
                      color: primaryColor,
                      shape: StacBoxShape.circle,
                    ),
                    constraints: const StacBoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: StacCenter(
                      child: StacText(
                        data: '0',
                        style: StacTextStyle(
                          color: StacColors.white,
                          fontSize: 10,
                          fontWeight: StacFontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                colors: [
                  primaryColor,
                  accentColor,
                ],
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

          // Category chips - static (no filtering in pure Stac)
          StacContainer(
            height: 40,
            margin: const StacEdgeInsets.only(left: 16, bottom: 16),
            child: StacSingleChildScrollView(
              scrollDirection: StacAxis.horizontal,
              child: StacRow(
                children: [
                  categoryChip('All', true),
                  ...categories.map((cat) => categoryChip(cat, false)),
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
