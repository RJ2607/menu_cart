import 'package:menu_cart/core/menu_data.dart';
import 'package:menu_cart/stac_runtime/actions/cart/place_order/st_place_order_action.dart';
import 'package:menu_cart/stac_runtime/actions/cart/update_cart_quantity/st_update_cart_quantity_action.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/cart_item_list_builder/st_cart_item_list_builder.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/cart_summary_builder/st_cart_summary_builder.dart';
import 'package:menu_cart/stac_runtime/widgets/collections/dismissible/st_dismissible.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/main_button/st_main_button.dart';
import 'package:menu_cart/stac_runtime/widgets/festive/festive_offer_bar/st_festive_offer_bar.dart';
import 'package:stac/stac_core.dart';

@StacScreen(screenName: 'cart')
StacWidget cartScreen() {
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
        const FestiveOfferBar(
          showWhenNone: false,
          compact: false,
          showRemoveButton: true,
        ),
        // Cart items list with swipe-to-dismiss and quantity controls
        StacExpanded(
          child: StacSingleChildScrollView(
            child: StacPadding(
              padding: const StacEdgeInsets.all(16),
              child: StCartItemListBuilder(
                headerText: '{{count}} {{label}} in cart',
                itemSingular: 'item',
                itemPlural: 'items',
                spacing: 12,
                emptyWidget: StacCenter(
                  child: StacPadding(
                    padding: const StacEdgeInsets.all(40),
                    child: StacColumn(
                      mainAxisSize: StacMainAxisSize.min,
                      children: [
                        StacIcon(
                          icon: StacIcons.shopping_cart,
                          size: 80,
                          color: '#636E72',
                        ),
                        const StacSizedBox(height: 16),
                        StacText(
                          data: 'Your cart is empty',
                          style: StacTextStyle(
                            fontSize: 20,
                            fontWeight: StacFontWeight.w600,
                            color: '#636E72',
                          ),
                        ),
                        const StacSizedBox(height: 8),
                        StacText(
                          data: 'Add some delicious items to get started!',
                          textAlign: StacTextAlign.center,
                          style: StacTextStyle(fontSize: 14, color: '#636E72'),
                        ),
                        const StacSizedBox(height: 12),
                        StacText(
                          data:
                              'Tip: tap a 🎉 festival card on home — DIWALI40, HELLO30 or MERRY500 auto-applies here.',
                          textAlign: StacTextAlign.center,
                          style: StacTextStyle(fontSize: 13, color: '#8A6A4A'),
                        ),
                      ],
                    ),
                  ),
                ),
                itemTemplate: StDismissible(
                  keyValue: 'cart-item-{{index}}',
                  direction: 'endToStart',
                  confirmDialog: const StDismissibleConfirmDialog(
                    title: 'Remove Item?',
                    message:
                        'Are you sure you want to remove this item from your cart?',
                    cancelLabel: 'Cancel',
                    confirmLabel: 'Remove',
                    confirmColor: '#E74C3C',
                  ),
                  onEndToStart: StUpdateCartQuantityAction(
                    index: 0, // Will be replaced by parser with {{index}}
                    quantity: 0, // 0 means remove item
                  ),
                  background: StacContainer(
                    alignment: StacAlignment.centerRight,
                    padding: const StacEdgeInsets.only(right: 20),
                    decoration: StacBoxDecoration(
                      color: '#E74C3C',
                      borderRadius: StacBorderRadius.circular(16),
                    ),
                    child: const StacIcon(
                      icon: StacIcons.delete,
                      color: StacColors.white,
                      size: 28,
                    ),
                  ),
                  child: StacContainer(
                    margin: StacEdgeInsets.only(bottom: 12),
                    padding: const StacEdgeInsets.all(12),
                    decoration: StacBoxDecoration(
                      color: StacColors.white,
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
                      children: [
                        // Item thumbnail
                        StacClipRRect(
                          borderRadius: StacBorderRadius.circular(12),
                          child: StacContainer(
                            width: 80,
                            height: 80,
                            color: '#FFF8F3',
                            child: const StacImage.network(
                              '{{imageUrl}}', // Replaced by parser
                              fit: StacBoxFit.cover,
                            ),
                          ),
                        ),
                        const StacSizedBox(width: 12),
                        // Item details
                        StacExpanded(
                          child: StacColumn(
                            crossAxisAlignment: StacCrossAxisAlignment.start,
                            mainAxisAlignment:
                                StacMainAxisAlignment.spaceBetween,
                            children: [
                              StacText(
                                data: '{{name}}', // Replaced by parser
                                style: StacTextStyle(
                                  fontSize: 16,
                                  fontWeight: StacFontWeight.w600,
                                  color: '#2D3436',
                                ),
                                maxLines: 2,
                                overflow: StacTextOverflow.ellipsis,
                              ),
                              const StacSizedBox(height: 4),
                              StacText(
                                data: '{{optionsText}}', // Replaced by parser
                                style: StacTextStyle(
                                  fontSize: 13,
                                  color: '#636E72',
                                ),
                              ),
                              const StacSizedBox(height: 8),
                              StacRow(
                                mainAxisAlignment:
                                    StacMainAxisAlignment.spaceBetween,
                                children: [
                                  // Quantity controls
                                  StacRow(
                                    mainAxisSize: StacMainAxisSize.min,
                                    children: [
                                      // Decrement button
                                      StacGestureDetector(
                                        onTap: StUpdateCartQuantityAction(
                                          index:
                                              0, // Replaced by parser with {{index}}
                                          quantity: -1, // Relative decrement
                                        ),
                                        child: StacContainer(
                                          width: 32,
                                          height: 32,
                                          decoration: StacBoxDecoration(
                                            color: '#FFF8F3',
                                            borderRadius:
                                                StacBorderRadius.circular(8),
                                            border: StacBorder.all(
                                              color: '#FF6B35',
                                              width: 1,
                                            ),
                                          ),
                                          child: const StacCenter(
                                            child: StacIcon(
                                              icon: StacIcons.remove,
                                              size: 18,
                                              color: '#FF6B35',
                                            ),
                                          ),
                                        ),
                                      ),
                                      StacContainer(
                                        width: 40,
                                        child: StacCenter(
                                          child: StacText(
                                            data:
                                                '{{quantity}}', // Replaced by parser
                                            style: StacTextStyle(
                                              fontSize: 16,
                                              fontWeight: StacFontWeight.w600,
                                              color: '#2D3436',
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Increment button
                                      StacGestureDetector(
                                        onTap: StUpdateCartQuantityAction(
                                          index:
                                              0, // Replaced by parser with {{index}}
                                          quantity: 1, // Relative increment
                                        ),
                                        child: StacContainer(
                                          width: 32,
                                          height: 32,
                                          decoration: StacBoxDecoration(
                                            color: '#FF6B35',
                                            borderRadius:
                                                StacBorderRadius.circular(8),
                                          ),
                                          child: const StacCenter(
                                            child: StacIcon(
                                              icon: StacIcons.add,
                                              size: 18,
                                              color: StacColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Item total price
                                  StacText(
                                    data:
                                        '₹{{totalPrice}}', // Replaced by parser
                                    style: StacTextStyle(
                                      fontSize: 18,
                                      fontWeight: StacFontWeight.w700,
                                      color: '#FF6B35',
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
                ),
              ),
            ),
          ),
        ),
        StCartSummaryBuilder(
          backgroundColor: '#FFFFFF',
          borderTopRadius: 24,
          padding: 20,
          rowSpacing: 12,
          showDivider: true,
          dividerColor: '#636E72',
          chargeItems: const [
            ChargeItem(
              label: 'Subtotal',
              valueKey: 'subtotal',
              color: '#636E72',
              fontSize: 16,
              fontWeight: 'w400',
            ),
            ChargeItem(
              label: 'Delivery Fee',
              valueKey: 'deliveryFee',
              color: '#636E72',
              fontSize: 16,
              fontWeight: 'w400',
            ),
            // Festive savings row — {{code}} is replaced with the active
            // offer code at runtime. Works for percent AND flat festivals;
            // future festivals need no changes here.
            ChargeItem(
              label: 'Festive Discount ({{code}})',
              valueKey: 'discount',
              color: '#1E8E3E',
              fontSize: 16,
              fontWeight: 'w600',
            ),
            ChargeItem(
              label: 'Total',
              valueKey: 'total',
              color: '#2D3436',
              fontSize: 20,
              fontWeight: 'w700',
              isTotal: true,
            ),
          ],
          actionButton: const StMainButton(
            title: 'Place Order',
            onPressed: StPlaceOrderAction(),
            color: '#FF6B35',
            textColor: '#FFFFFF',
          ),
        ),
      ],
    ),
  );
}
