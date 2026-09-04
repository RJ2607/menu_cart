import 'package:menu_cart/stac_runtime/widgets/collections/dismissible/st_dismissible.dart';
import 'package:stac/stac_core.dart';

import 'menu_data.dart';

/// Cart screen - Static Stac version
/// Note: This shows seeded cart data. For full dynamic cart functionality,
/// use a Flutter screen with CartController instead of pure Stac DSL
@StacScreen(screenName: 'cart')
StacWidget cartScreen() {
  final subtotal = calculateSubtotal(seededCartItems);
  final total = calculateTotal(seededCartItems);

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
        // Cart items list
        StacExpanded(
          child: StacSingleChildScrollView(
            child: StacPadding(
              padding: const StacEdgeInsets.all(16),
              child: StacColumn(
                crossAxisAlignment: StacCrossAxisAlignment.start,
                children: [
                  // Cart items count
                  StacText(
                    data:
                        '${seededCartItems.length} ${seededCartItems.length == 1 ? "item" : "items"} in cart',
                    style: StacTextStyle(fontSize: 14, color: textSecondary),
                  ),

                  const StacSizedBox(height: 16),

                  // Cart items with dismissible wrapper
                  ...seededCartItems.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final itemTotal =
                        (item['price'] as double) * (item['quantity'] as int);

                    return StDismissible(
                      keyValue: 'cart-item-$index',
                      direction: 'endToStart',
                      background: StacContainer(
                        alignment: StacAlignment.centerRight,
                        padding: const StacEdgeInsets.only(right: 20),
                        decoration: StacBoxDecoration(
                          color: '#FFE74C3C',
                          borderRadius: StacBorderRadius.circular(16),
                        ),
                        child: const StacIcon(
                          icon: StacIcons.delete,
                          color: StacColors.white,
                          size: 28,
                        ),
                      ),
                      confirmDialog: StDismissibleConfirmDialog(
                        title: 'Remove Item?',
                        message:
                            'Are you sure you want to remove this item from your cart?',
                        cancelLabel: 'Cancel',
                        confirmLabel: 'Remove',
                        confirmColor: '#FFE74C3C',
                      ),
                      secondaryBackground: StacContainer(
                        alignment: StacAlignment.centerRight,
                        padding: const StacEdgeInsets.only(right: 20),
                        decoration: StacBoxDecoration(
                          color: '#FFE74C3C',
                          borderRadius: StacBorderRadius.circular(16),
                        ),
                        child: const StacIcon(
                          icon: StacIcons.delete,
                          color: StacColors.white,
                          size: 28,
                        ),
                      ),
                      child: StacContainer(
                        margin: const StacEdgeInsets.only(bottom: 12),
                        padding: const StacEdgeInsets.all(12),
                        decoration: StacBoxDecoration(
                          color: StacColors.white,
                          borderRadius: StacBorderRadius.circular(16),
                          boxShadow: [
                            StacBoxShadow(
                              color: StacColors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const StacOffset(dx: 0, dy: 2),
                            ),
                          ],
                        ),
                        child: StacRow(
                          children: [
                            // Item thumbnail
                            StacClipRRect(
                              borderRadius: StacBorderRadius.circular(12),
                              child: StacContainer(
                                width: 80,
                                height: 80,
                                decoration: StacBoxDecoration(
                                  color: surfaceColor,
                                ),
                                child: StacImage.network(
                                  item['imageUrl'] as String,
                                  fit: StacBoxFit.cover,
                                ),
                              ),
                            ),

                            const StacSizedBox(width: 12),

                            // Item details
                            StacExpanded(
                              child: StacColumn(
                                crossAxisAlignment:
                                    StacCrossAxisAlignment.start,
                                mainAxisAlignment:
                                    StacMainAxisAlignment.spaceBetween,
                                children: [
                                  StacText(
                                    data: item['name'] as String,
                                    style: StacTextStyle(
                                      fontSize: 16,
                                      fontWeight: StacFontWeight.w600,
                                      color: textPrimary,
                                    ),
                                    maxLines: 2,
                                    overflow: StacTextOverflow.ellipsis,
                                  ),
                                  const StacSizedBox(height: 4),
                                  StacText(
                                    data: item['options'] as String,
                                    style: StacTextStyle(
                                      fontSize: 13,
                                      color: textSecondary,
                                    ),
                                  ),
                                  const StacSizedBox(height: 8),
                                  StacRow(
                                    mainAxisAlignment:
                                        StacMainAxisAlignment.spaceBetween,
                                    children: [
                                      // Quantity display
                                      StacContainer(
                                        padding: const StacEdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: StacBoxDecoration(
                                          color: surfaceColor,
                                          borderRadius:
                                              StacBorderRadius.circular(8),
                                        ),
                                        child: StacText(
                                          data: 'Qty: ${item['quantity']}',
                                          style: StacTextStyle(
                                            fontSize: 14,
                                            fontWeight: StacFontWeight.w600,
                                            color: textPrimary,
                                          ),
                                        ),
                                      ),
                                      // Item total
                                      StacText(
                                        data:
                                            '\$${itemTotal.toStringAsFixed(2)}',
                                        style: StacTextStyle(
                                          fontSize: 18,
                                          fontWeight: StacFontWeight.w700,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  const StacSizedBox(height: 16),

                  // Empty cart message (shown when no items, currently hidden)
                  if (seededCartItems.isEmpty)
                    StacCenter(
                      child: StacPadding(
                        padding: const StacEdgeInsets.all(40),
                        child: StacColumn(
                          children: [
                            StacIcon(
                              icon: StacIcons.shopping_cart,
                              size: 80,
                              color: textSecondary.withOpacity(0.3),
                            ),
                            const StacSizedBox(height: 16),
                            StacText(
                              data: 'Your cart is empty',
                              style: StacTextStyle(
                                fontSize: 20,
                                fontWeight: StacFontWeight.w600,
                                color: textSecondary,
                              ),
                            ),
                            const StacSizedBox(height: 8),
                            StacText(
                              data: 'Add some delicious items to get started!',
                              style: StacTextStyle(
                                fontSize: 14,
                                color: textSecondary,
                              ),
                              textAlign: StacTextAlign.center,
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

        // Order summary section
        if (seededCartItems.isNotEmpty)
          StacContainer(
            padding: const StacEdgeInsets.all(20),
            decoration: StacBoxDecoration(
              color: StacColors.white,
              borderRadius: const StacBorderRadius.only(
                topLeft: 24,
                topRight: 24,
              ),
              boxShadow: [
                StacBoxShadow(
                  color: StacColors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const StacOffset(dx: 0, dy: -5),
                ),
              ],
            ),
            child: StacColumn(
              children: [
                // Subtotal
                StacRow(
                  mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                  children: [
                    StacText(
                      data: 'Subtotal',
                      style: StacTextStyle(fontSize: 16, color: textSecondary),
                    ),
                    StacText(
                      data: '\$${subtotal.toStringAsFixed(2)}',
                      style: StacTextStyle(
                        fontSize: 16,
                        fontWeight: StacFontWeight.w600,
                        color: textPrimary,
                      ),
                    ),
                  ],
                ),

                const StacSizedBox(height: 12),

                // Delivery fee
                StacRow(
                  mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                  children: [
                    StacText(
                      data: 'Delivery Fee',
                      style: StacTextStyle(fontSize: 16, color: textSecondary),
                    ),
                    StacText(
                      data: '\$${deliveryFee.toStringAsFixed(2)}',
                      style: StacTextStyle(
                        fontSize: 16,
                        fontWeight: StacFontWeight.w600,
                        color: textPrimary,
                      ),
                    ),
                  ],
                ),

                const StacSizedBox(height: 12),

                StacDivider(
                  color: textSecondary.withOpacity(0.2),
                  thickness: 1,
                ),

                const StacSizedBox(height: 12),

                // Total
                StacRow(
                  mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                  children: [
                    StacText(
                      data: 'Total',
                      style: StacTextStyle(
                        fontSize: 20,
                        fontWeight: StacFontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    StacText(
                      data: '\$${total.toStringAsFixed(2)}',
                      style: StacTextStyle(
                        fontSize: 24,
                        fontWeight: StacFontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),

                const StacSizedBox(height: 20),

                // Place order button - navigates back to menu
                StacRow(
                  children: [
                    StacExpanded(
                      child: StacElevatedButton(
                        onPressed: StacNavigator.pushStac('menu'),
                        style: StacButtonStyle(
                          backgroundColor: primaryColor,
                          padding: const StacEdgeInsets.symmetric(vertical: 16),
                          shape: StacRoundedRectangleBorder(
                            borderRadius: StacBorderRadius.circular(12),
                          ),
                        ),
                        child: StacText(
                          data: 'Back to Menu (Demo)',
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
              ],
            ),
          ),
      ],
    ),
  );
}
