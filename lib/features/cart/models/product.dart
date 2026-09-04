import 'package:equatable/equatable.dart';

/// Represents a menu item/product
class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String imageUrl;
  final bool isVegetarian;
  final bool isAvailable;
  final bool isFeatured;
  final List<ProductSize>? sizes;
  final List<ProductAddon>? addons;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.isVegetarian = false,
    this.isAvailable = true,
    this.isFeatured = false,
    this.sizes,
    this.addons,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      isVegetarian: json['isVegetarian'] as bool? ?? false,
      isAvailable: json['isAvailable'] as bool? ?? true,
      isFeatured: json['isFeatured'] as bool? ?? false,
      sizes: json['sizes'] != null
          ? (json['sizes'] as List)
              .map((s) => ProductSize.fromJson(s as Map<String, dynamic>))
              .toList()
          : null,
      addons: json['addons'] != null
          ? (json['addons'] as List)
              .map((a) => ProductAddon.fromJson(a as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'isVegetarian': isVegetarian,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'sizes': sizes?.map((s) => s.toJson()).toList(),
      'addons': addons?.map((a) => a.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        price,
        imageUrl,
        isVegetarian,
        isAvailable,
        isFeatured,
        sizes,
        addons,
      ];
}

/// Represents a size option for a product
class ProductSize extends Equatable {
  final String id;
  final String name;
  final double priceModifier;

  const ProductSize({
    required this.id,
    required this.name,
    required this.priceModifier,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'] as String,
      name: json['name'] as String,
      priceModifier: (json['priceModifier'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'priceModifier': priceModifier,
    };
  }

  @override
  List<Object?> get props => [id, name, priceModifier];
}

/// Represents an addon/modifier for a product
class ProductAddon extends Equatable {
  final String id;
  final String name;
  final double price;

  const ProductAddon({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductAddon.fromJson(Map<String, dynamic> json) {
    return ProductAddon(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [id, name, price];
}
