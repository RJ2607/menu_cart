import 'package:get/get.dart';

/// Cart item model
class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final double basePrice;
  int quantity;
  String selectedSize;
  List<String> selectedAddons;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.basePrice,
    this.quantity = 1,
    this.selectedSize = 'Regular',
    this.selectedAddons = const [],
  });

  double get itemPrice {
    double price = basePrice;
    if (selectedSize == 'Large') price += 2.50;
    for (var addon in selectedAddons) {
      switch (addon) {
        case 'Extra Cheese':
          price += 1.50;
          break;
        case 'Bacon':
          price += 2.00;
          break;
        case 'Avocado':
          price += 2.50;
          break;
      }
    }
    return price;
  }

  double get totalPrice => itemPrice * quantity;

  String get optionsText {
    final options = <String>[selectedSize];
    options.addAll(selectedAddons);
    return options.join(', ');
  }
}

/// GetX Controller for cart state management
class CartController extends GetxController {
  static CartController get to => Get.find();

  final RxList<CartItem> cartItems = <CartItem>[].obs;
  final RxSet<String> favorites = <String>{}.obs;
  final RxString selectedCategory = 'All'.obs;

  int get cartCount => cartItems.fold(0, (sum, item) => sum + item.quantity);
  double get subtotal => cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  double get deliveryFee => 3.99;
  double get total => subtotal + deliveryFee;

  bool isFavorite(String itemId) => favorites.contains(itemId);

  void toggleFavorite(String itemId) {
    if (favorites.contains(itemId)) {
      favorites.remove(itemId);
    } else {
      favorites.add(itemId);
    }
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void addToCart({
    required String id,
    required String name,
    required String imageUrl,
    required double basePrice,
    String size = 'Regular',
    List<String> addons = const [],
  }) {
    final existingIndex = cartItems.indexWhere((item) =>
        item.id == id &&
        item.selectedSize == size &&
        _listsEqual(item.selectedAddons, addons));

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(
        id: id,
        name: name,
        imageUrl: imageUrl,
        basePrice: basePrice,
        quantity: 1,
        selectedSize: size,
        selectedAddons: List.from(addons),
      ));
    }
  }

  void updateQuantity(int index, int quantity) {
    if (index >= 0 && index < cartItems.length) {
      if (quantity <= 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index].quantity = quantity;
        cartItems.refresh();
      }
    }
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  bool _listsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    final aSet = Set.from(a);
    final bSet = Set.from(b);
    return aSet.difference(bSet).isEmpty && bSet.difference(aSet).isEmpty;
  }

  void seedCartData() {
    cartItems.clear();
    cartItems.addAll([
      CartItem(
        id: 'burger_classic',
        name: 'Classic Urban Burger',
        imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800',
        basePrice: 12.99,
        quantity: 2,
        selectedSize: 'Large',
        selectedAddons: ['Extra Cheese'],
      ),
      CartItem(
        id: 'fries_truffle',
        name: 'Truffle Parmesan Fries',
        imageUrl: 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=800',
        basePrice: 5.99,
        quantity: 1,
        selectedSize: 'Regular',
        selectedAddons: [],
      ),
    ]);
  }

  @override
  void onInit() {
    super.onInit();
    seedCartData();
  }
}
