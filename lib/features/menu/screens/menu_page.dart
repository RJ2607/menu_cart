import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_cart/features/cart/controllers/cart_controller.dart';
import 'package:menu_cart/features/products/controllers/product_controller.dart';
import 'package:menu_cart/features/cart/models/models.dart';
import '../../../shared/widgets/animated_pressable.dart';
import '../../../shared/animations/hero_animations.dart';
import '../../../stac_data/menu_data.dart' as menu_data;

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final productController = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Urban Bites',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF169AB4),
              ),
            ),
            Text(
              'Fresh Street Food, Elevated',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF636E72),
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Color(0xFF2D3436)),
                onPressed: () => Get.toNamed('/cart'),
              ),
              if (cartController.itemCount > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF169AB4),
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        '${cartController.itemCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional banner
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF169AB4),
                    const Color(0xFFF7931E),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      menu_data.promoText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(Icons.local_shipping, color: Colors.white, size: 28),
                ],
              ),
            ),

            // Category chips
            Container(
              height: 40,
              margin: const EdgeInsets.only(left: 16, bottom: 16),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productController.categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = productController.categories[index];
                  final isSelected = category == productController.selectedCategory;
                  return GestureDetector(
                    onTap: () => productController.setCategory(category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF169AB4) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Menu items by category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mains section
                  const SectionHeader(title: 'Mains'),
                  ...productController.filteredProducts
                      .where((p) => p.category == 'Mains')
                      .map((product) => FoodCard(product: product)),

                  const SizedBox(height: 16),

                  // Sides section
                  const SectionHeader(title: 'Sides'),
                  ...productController.filteredProducts
                      .where((p) => p.category == 'Sides')
                      .map((product) => FoodCard(product: product)),

                  const SizedBox(height: 16),

                  // Drinks section
                  const SectionHeader(title: 'Drinks'),
                  ...productController.filteredProducts
                      .where((p) => p.category == 'Drinks')
                      .map((product) => FoodCard(product: product)),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Product product;

  const FoodCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPressable(
      onTap: () => Get.toNamed('/item_detail', arguments: {'itemId': product.id}),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Item image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(color: Colors.grey[100]),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 40),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Item details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3436),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF636E72),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF169AB4),
                        ),
                      ),
                      if (!product.isAvailable)
                        const Chip(
                          label: Text('Unavailable'),
                          backgroundColor: Color(0xFFD33030),
                          labelStyle: TextStyle(color: Colors.white, fontSize: 10),
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
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xFF2D3436),
        ),
      ),
    );
  }
}
