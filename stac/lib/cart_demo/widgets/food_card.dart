import 'package:stac/stac_core.dart';

import '../menu_data.dart';

/// Creates a card for a menu item
StacWidget foodCard(MenuItem item) {
  return StacGestureDetector(
    onTap: item.isAvailable
        ? StacNavigator.pushStac('item_detail', arguments: {'itemId': item.id})
        : null,
    child: StacContainer(
      margin: const StacEdgeInsets.only(bottom: 16),
      decoration: StacBoxDecoration(
        color:cardColor,
        borderRadius: StacBorderRadius.circular(16),
        boxShadow: [
          StacBoxShadow(
            color: StacColors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const StacOffset(dx:0, dy:2),
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
              child: item.isAvailable
                  ? StacImage.network(item.imageUrl, fit: StacBoxFit.cover)
                  : StacStack(
                      children: [
                        StacImage.network(item.imageUrl, fit: StacBoxFit.cover),
                        StacContainer(color: StacColors.black.withOpacity(0.5)),
                      ],
                    ),
            ),
          ),
          // Item details
          StacExpanded(
            child: StacPadding(
              padding: const StacEdgeInsets.all(12),
              child: StacColumn(
                crossAxisAlignment: StacCrossAxisAlignment.start,
                mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                children: [
                  StacColumn(
                    crossAxisAlignment: StacCrossAxisAlignment.start,
                    children: [
                      // Name and badges row
                      StacRow(
                        children: [
                          StacExpanded(
                            child: StacText(
                              data: item.name,
                              style: StacTextStyle(
                                fontSize: 16,
                                fontWeight: StacFontWeight.w600,
                                color: item.isAvailable
                                    ? textPrimary
                                    : textSecondary,
                              ),
                              maxLines: 1,
                              overflow: StacTextOverflow.ellipsis,
                            ),
                          ),
                          const StacSizedBox(width: 8),
                          // Badges
                          if (item.isVegetarian)
                            StacContainer(
                              padding: const StacEdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: StacBoxDecoration(
                                color: '#FFD700',
                                borderRadius: StacBorderRadius.circular(4),
                              ),
                              child:  StacText(
                                data: '🌱',
                                style: StacTextStyle(fontSize: 10),
                              ),
                            ),
                          if (item.isFeatured)
                            StacContainer(
                              margin: const StacEdgeInsets.only(left: 4),
                              padding: const StacEdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: StacBoxDecoration(
                                color: accentColor,
                                borderRadius: StacBorderRadius.circular(4),
                              ),
                              child:  StacText(
                                data: '⭐',
                                style: StacTextStyle(fontSize: 10),
                              ),
                            ),
                        ],
                      ),
                      const StacSizedBox(height: 4),
                      // Description
                      StacText(
                        data: item.description,
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
                  // Price and availability
                  StacRow(
                    mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                    children: [
                      StacText(
                        data: '\$${item.price.toStringAsFixed(2)}',
                        style: StacTextStyle(
                          fontSize: 18,
                          fontWeight: StacFontWeight.w700,
                          color: item.isAvailable
                              ? primaryColor
                              : textSecondary,
                        ),
                      ),
                      if (!item.isAvailable)
                        StacContainer(
                          padding: const StacEdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: StacBoxDecoration(
                            color: textSecondary.withOpacity(0.1),
                            borderRadius: StacBorderRadius.circular(6),
                          ),
                          child: StacText(
                            data: 'Unavailable',
                            style: StacTextStyle(
                              fontSize: 11,
                              fontWeight: StacFontWeight.w600,
                              color: textSecondary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
