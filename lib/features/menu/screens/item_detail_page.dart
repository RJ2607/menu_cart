import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/features/cart/controllers/cart_controller.dart';
import 'package:menu_cart/features/products/controllers/product_controller.dart';
import 'package:menu_cart/features/cart/models/models.dart';
import '../../../shared/widgets/animated_pressable.dart';
import '../../../stac_data/menu_data.dart' as menu_data;

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final productController = Get.find<ProductController>();

    // Get item ID from route arguments
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String itemId = arguments['itemId']?.toString() ?? menu_data.featuredItemId;

    // Get the product
    final product = productController.getProductById(itemId);

    if (product == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Color(0xFF636E72)),
              const SizedBox(height: 16),
              const Text(
                'Product not found',
                style: TextStyle(fontSize: 18, color: Color(0xFF636E72)),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF169AB4),
                ),
                child: const Text('Back to Menu'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image with back button
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(color: const Color(0xFFFFF8F3)),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 300,
                      color: Colors.grey[100],
                      child: const Icon(Icons.image, size: 60),
                    ),
                  ),
                ),
                // Gradient overlay
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Back button
                Positioned(
                  top: 44,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios, size: 24),
                    ),
                  ),
                ),
                // Favorite button
                Positioned(
                  top: 44,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border, size: 24),
                  ),
                ),
              ],
            ),

            // Item details
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and badges
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3436),
                          ),
                        ),
                      ),
                      if (product.isVegetarian)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '🌱 Veggie',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF636E72),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Dynamic price
                  Obx(() {
                    double price = product.price;
                    if (product.sizes != null && selectedSizeId.value != null) {
                      final size = product.sizes!.firstWhere(
                        (s) => s.id == selectedSizeId.value,
                        orElse: () => product.sizes!.first,
                      );
                      price += size.priceModifier;
                    }
                    price += selectedAddons.value.fold(0.0, (sum, addon) => sum + addon.price);

                    return Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF169AB4),
                      ),
                    );
                  }),

                  const SizedBox(height: 24),

                  // Size selection
                  if (product.sizes != null && product.sizes!.isNotEmpty) ...[
                    const Text(
                      'Choose Size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3436),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: product.sizes!.map((size) {
                        final isSelected = size.id == selectedSizeId.value;
                        return GestureDetector(
                          onTap: () => selectedSizeId.value = size.id,
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF169AB4) : const Color(0xFFFFF8F3),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF169AB4)
                                    : const Color(0xFF636E72).withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  size.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF2D3436),
                                  ),
                                ),
                                if (size.priceModifier > 0)
                                  Text(
                                    '+\$${size.priceModifier.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isSelected
                                          ? Colors.white.withOpacity(0.9)
                                          : const Color(0xFF636E72),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),
                  ],

                  // Add-ons
                  if (product.addons != null && product.addons!.isNotEmpty) ...[
                    const Text(
                      'Add-Ons',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3436),
                      ),
                    ),

                    const SizedBox(height: 12),

                    ...product.addons!.map((addon) {
                      final isSelected = selectedAddons.value.contains(addon);
                      return GestureDetector(
                        onTap: () {
                          if (isSelected) {
                            selectedAddons.value.remove(addon);
                          } else {
                            selectedAddons.value.add(addon);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF8F3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF169AB4)
                                  : const Color(0xFF636E72).withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                addon.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: const Color(0xFF2D3436),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '+\$${addon.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF169AB4),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: isSelected
                                        ? const Color(0xFF169AB4)
                                        : const Color(0xFF636E72).withOpacity(0.2),
                                    size: 22,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 32),
                  ],

                  // Add to cart button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get selected size
                        ProductSize? selectedSize;
                        if (selectedSizeId.value != null && product.sizes != null) {
                          selectedSize = product.sizes!.firstWhere(
                            (s) => s.id == selectedSizeId.value,
                            orElse: () => product.sizes!.first,
                          );
                        }

                        // Add to cart
                        cartController.addItem(
                          product: product,
                          size: selectedSize,
                          addons: selectedAddons.value.toList(),
                          quantity: 1,
                        );

                        // Navigate to cart
                        Get.toNamed('/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF169AB4),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Obx(() => Text(
                        'Add to Cart - \$${_calculatePrice(product).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculatePrice(Product product) {
    double price = product.price;
    if (product.sizes != null && selectedSizeId.value != null) {
      final size = product.sizes!.firstWhere(
        (s) => s.id == selectedSizeId.value,
        orElse: () => product.sizes!.first,
      );
      price += size.priceModifier;
    }
    price += selectedAddons.value.fold(0.0, (sum, addon) => sum + addon.price);
    return price;
  }
}

// State variables for the item detail screen
final Rx<String?> selectedSizeId = Rx<String?>(null);
final Rx<List<ProductAddon>> selectedAddons = Rx<List<ProductAddon>>([]);
