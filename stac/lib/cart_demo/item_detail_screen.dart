import 'package:menu_cart/stac_runtime/widgets/controls/animated_icon_toggle/st_animated_icon_toggle.dart';
import 'package:stac/stac_core.dart';

import 'menu_data.dart';

/// Item detail screen - Static Stac version
/// Note: For full dynamic functionality with variant selection and real-time price updates,
/// use a Flutter screen instead of pure Stac DSL
@StacScreen(screenName: 'item_detail')
StacWidget itemDetailScreen() {
  // Use the featured item for this static demo
  final item = getItemById(featuredItemId)!;

  return StacScaffold(
    backgroundColor: StacColors.white,
    body: StacSingleChildScrollView(
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
                child: StacImage.network(item.imageUrl, fit: StacBoxFit.cover),
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
                        data: item.name,
                        style: StacTextStyle(
                          fontSize: 26,
                          fontWeight: StacFontWeight.w700,
                          color: textPrimary,
                        ),
                      ),
                    ),
                    if (item.isVegetarian)
                      StacContainer(
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
                  ],
                ),

                const StacSizedBox(height: 8),

                // Description
                StacText(
                  data: item.description,
                  style: StacTextStyle(
                    fontSize: 16,
                    color: textSecondary,
                    height: 1.5,
                  ),
                ),

                const StacSizedBox(height: 8),

                // Price
                StacText(
                  data: '\$${item.price.toStringAsFixed(2)}',
                  style: StacTextStyle(
                    fontSize: 28,
                    fontWeight: StacFontWeight.w700,
                    color: primaryColor,
                  ),
                ),

                const StacSizedBox(height: 24),

                // Size selection - static display
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
                  children: sizeOptions.map((size) {
                    final isSelected = size['label'] == 'Regular';
                    return StacContainer(
                      margin: const StacEdgeInsets.only(right: 12),
                      padding: const StacEdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: StacBoxDecoration(
                        color: isSelected ? primaryColor : surfaceColor,
                        borderRadius: StacBorderRadius.circular(12),
                        border: StacBorder.all(
                          color: isSelected
                              ? primaryColor
                              : textSecondary.withOpacity(0.2),
                          width: 2,
                        ),
                      ),
                      child: StacColumn(
                        children: [
                          StacText(
                            data: size['label'] as String,
                            style: StacTextStyle(
                              fontSize: 14,
                              fontWeight: StacFontWeight.w600,
                              color: isSelected
                                  ? StacColors.white
                                  : textPrimary,
                            ),
                          ),
                          if ((size['price'] as double) > 0)
                            StacText(
                              data:
                                  '+\$${(size['price'] as double).toStringAsFixed(2)}',
                              style: StacTextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? StacColors.white.withOpacity(0.9)
                                    : textSecondary,
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const StacSizedBox(height: 24),

                // Add-ons - static display
                StacText(
                  data: 'Add-Ons',
                  style: StacTextStyle(
                    fontSize: 18,
                    fontWeight: StacFontWeight.w600,
                    color: textPrimary,
                  ),
                ),

                const StacSizedBox(height: 12),

                ...addonOptions.asMap().entries.map((entry) {
                  final addon = entry.value;
                  final isSelected =
                      entry.key == 0; // First item selected for demo
                  return StacContainer(
                    margin: const StacEdgeInsets.only(bottom: 10),
                    padding: const StacEdgeInsets.all(16),
                    decoration: StacBoxDecoration(
                      color: surfaceColor,
                      borderRadius: StacBorderRadius.circular(12),
                      border: StacBorder.all(
                        color: isSelected
                            ? primaryColor
                            : textSecondary.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: StacRow(
                      mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                      children: [
                        StacText(
                          data: addon['label'] as String,
                          style: StacTextStyle(
                            fontSize: 15,
                            fontWeight: isSelected
                                ? StacFontWeight.w600
                                : StacFontWeight.w400,
                            color: textPrimary,
                          ),
                        ),
                        StacRow(
                          children: [
                            StacText(
                              data:
                                  '+\$${(addon['price'] as double).toStringAsFixed(2)}',
                              style: StacTextStyle(
                                fontSize: 15,
                                fontWeight: StacFontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            const StacSizedBox(width: 8),
                            StacIcon(
                              icon: isSelected
                                  ? StacIcons.check_circle
                                  : StacIcons.radio_button_unchecked,
                              color: isSelected
                                  ? primaryColor
                                  : textSecondary.withOpacity(0.2),
                              size: 22,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),

                const StacSizedBox(height: 32),

                // Add to cart button - navigates to cart
                StacRow(
                  children: [
                    StacExpanded(
                      child: StacElevatedButton(
                        onPressed: StacNavigator.pushStac('cart'),
                        style: StacButtonStyle(
                          backgroundColor: primaryColor,
                          padding: const StacEdgeInsets.symmetric(vertical: 16),
                          shape: StacRoundedRectangleBorder(
                            borderRadius: StacBorderRadius.circular(12),
                          ),
                        ),
                        child: StacText(
                          data: 'View Cart',
                          style: StacTextStyle(
                            fontSize: 18,
                            fontWeight: StacFontWeight.w700,
                            color: StacColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const StacSizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
