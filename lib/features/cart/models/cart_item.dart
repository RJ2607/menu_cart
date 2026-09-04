import 'package:equatable/equatable.dart';
import 'product.dart';

/// Represents an item in the shopping cart
class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final ProductSize? selectedSize;
  final List<ProductAddon> selectedAddons;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    this.selectedSize,
    this.selectedAddons = const [],
  });

  /// Calculate the total price for this cart item
  double get totalPrice {
    double basePrice = product.price;
    
    // Add size modifier
    if (selectedSize != null) {
      basePrice += selectedSize!.priceModifier;
    }
    
    // Add addon prices
    double addonsTotal = selectedAddons.fold(0.0, (sum, addon) => sum + addon.price);
    
    return (basePrice + addonsTotal) * quantity;
  }

  /// Get the unit price (including size and addons)
  double get unitPrice {
    double basePrice = product.price;
    
    if (selectedSize != null) {
      basePrice += selectedSize!.priceModifier;
    }
    
    double addonsTotal = selectedAddons.fold(0.0, (sum, addon) => sum + addon.price);
    
    return basePrice + addonsTotal;
  }

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    ProductSize? selectedSize,
    List<ProductAddon>? selectedAddons,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedAddons: selectedAddons ?? this.selectedAddons,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      selectedSize: json['selectedSize'] != null
          ? ProductSize.fromJson(json['selectedSize'] as Map<String, dynamic>)
          : null,
      selectedAddons: json['selectedAddons'] != null
          ? (json['selectedAddons'] as List)
              .map((a) => ProductAddon.fromJson(a as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'selectedSize': selectedSize?.toJson(),
      'selectedAddons': selectedAddons.map((a) => a.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        product,
        quantity,
        selectedSize,
        selectedAddons,
      ];
}
