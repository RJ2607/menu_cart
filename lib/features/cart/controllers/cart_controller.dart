import 'dart:convert';
import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/models.dart';

/// Controller for managing the shopping cart
class CartController extends GetxController {
  final _storage = GetStorage();
  static const String _cartStorageKey = 'cart_items';
  
  // Observable list of cart items
  final RxList<CartItem> _items = <CartItem>[].obs;
  
  // Delivery fee constant
  final double deliveryFee = 5.0;
  
  // Getters
  List<CartItem> get items => _items;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  
  double get subtotal => _items.fold(
    0.0, 
    (sum, item) => sum + item.totalPrice,
  );
  
  double get total => subtotal + deliveryFee;
  
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }

  /// Load cart from storage
  void _loadCart() {
    try {
      final stored = _storage.read(_cartStorageKey);
      if (stored != null) {
        final List<dynamic> jsonList = jsonDecode(stored as String);
        _items.value = jsonList
            .map((json) => CartItem.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      developer.log('Error loading cart: $e', name: 'CartController');
    }
  }

  /// Save cart to storage
  void _saveCart() {
    try {
      final jsonList = _items.map((item) => item.toJson()).toList();
      _storage.write(_cartStorageKey, jsonEncode(jsonList));
    } catch (e) {
      developer.log('Error saving cart: $e', name: 'CartController');
    }
  }

  /// Add item to cart or update quantity if exists with same options
  void addItem({
    required Product product,
    ProductSize? size,
    List<ProductAddon> addons = const [],
    int quantity = 1,
  }) {
    // Check if item with same product and options already exists
    final existingIndex = _items.indexWhere((item) =>
        item.product.id == product.id &&
        item.selectedSize?.id == size?.id &&
        _addonListsMatch(item.selectedAddons, addons));

    if (existingIndex >= 0) {
      // Update quantity of existing item
      final existingItem = _items[existingIndex];
      _items[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
    } else {
      // Add new item
      final newItem = CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        product: product,
        quantity: quantity,
        selectedSize: size,
        selectedAddons: addons,
      );
      _items.add(newItem);
    }
    
    _saveCart();
    Get.snackbar(
      'Added to Cart',
      '${product.name} added successfully',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  /// Check if two addon lists are the same
  bool _addonListsMatch(List<ProductAddon> list1, List<ProductAddon> list2) {
    if (list1.length != list2.length) return false;
    final ids1 = list1.map((a) => a.id).toSet();
    final ids2 = list2.map((a) => a.id).toSet();
    return ids1.containsAll(ids2) && ids2.containsAll(ids1);
  }

  /// Remove item from cart
  void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    _saveCart();
  }

  /// Update item quantity
  void updateQuantity(String itemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(itemId);
      return;
    }
    
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: newQuantity);
      _saveCart();
    }
  }

  /// Increment item quantity
  void incrementQuantity(String itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      final currentQuantity = _items[index].quantity;
      updateQuantity(itemId, currentQuantity + 1);
    }
  }

  /// Decrement item quantity
  void decrementQuantity(String itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      final currentQuantity = _items[index].quantity;
      updateQuantity(itemId, currentQuantity - 1);
    }
  }

  /// Clear all items from cart
  void clearCart() {
    _items.clear();
    _saveCart();
  }

  /// Create an order from current cart
  Order createOrder() {
    final orderItems = _items.map((cartItem) {
      return OrderItem(
        productId: cartItem.product.id,
        productName: cartItem.product.name,
        quantity: cartItem.quantity,
        unitPrice: cartItem.unitPrice,
        totalPrice: cartItem.totalPrice,
        size: cartItem.selectedSize?.name,
        addons: cartItem.selectedAddons.map((a) => a.name).toList(),
      );
    }).toList();

    return Order(
      id: 'ORDER-${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      total: total,
      status: 'pending',
      items: orderItems,
    );
  }

  /// Place order (demo implementation)
  Future<Order> placeOrder() async {
    if (isEmpty) {
      throw Exception('Cart is empty');
    }

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    final order = createOrder();
    
    // Clear cart after successful order
    clearCart();
    
    return order;
  }
}
