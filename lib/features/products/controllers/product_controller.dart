import 'package:get/get.dart';
import '../../cart/models/models.dart';
import '../../../stac_data/menu_data.dart' as menu_data;

/// Controller for managing products/menu items
class ProductController extends GetxController {
  // Observable list of all products
  final RxList<Product> _products = <Product>[].obs;
  
  // Selected category filter
  final RxString _selectedCategory = 'All'.obs;
  
  // Getters
  List<Product> get products => _products;
  String get selectedCategory => _selectedCategory.value;
  
  /// Get filtered products by category
  List<Product> get filteredProducts {
    if (_selectedCategory.value == 'All') {
      return _products;
    }
    return _products
        .where((product) => product.category == _selectedCategory.value)
        .toList();
  }
  
  /// Get available categories
  List<String> get categories => ['All', ...menu_data.categories];
  
  /// Get product by ID
  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
  }

  /// Load products from menu data
  void _loadProducts() {
    // Convert menu items to Product models with sizes and addons
    _products.value = menu_data.menuItems.map((item) {
      // Create size options
      final sizes = menu_data.sizeOptions.map((sizeData) {
        return ProductSize(
          id: sizeData['label'].toString().toLowerCase(),
          name: sizeData['label'] as String,
          priceModifier: (sizeData['price'] as num).toDouble(),
        );
      }).toList();

      // Create addon options
      final addons = menu_data.addonOptions.map((addonData) {
        return ProductAddon(
          id: addonData['label'].toString().toLowerCase().replaceAll(' ', '_'),
          name: addonData['label'] as String,
          price: (addonData['price'] as num).toDouble(),
        );
      }).toList();

      return Product(
        id: item.id,
        name: item.name,
        description: item.description,
        category: item.category,
        price: item.price,
        imageUrl: item.imageUrl,
        isVegetarian: item.isVegetarian,
        isAvailable: item.isAvailable,
        isFeatured: item.isFeatured,
        sizes: sizes,
        addons: addons,
      );
    }).toList();
  }

  /// Set category filter
  void setCategory(String category) {
    _selectedCategory.value = category;
  }

  /// Get featured product
  Product? get featuredProduct {
    try {
      return _products.firstWhere((product) => product.isFeatured);
    } catch (_) {
      return _products.isNotEmpty ? _products.first : null;
    }
  }
}
