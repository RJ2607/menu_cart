import 'package:equatable/equatable.dart';

/// Represents a placed order
class Order extends Equatable {
  final String id;
  final DateTime createdAt;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String status;
  final List<OrderItem> items;

  const Order({
    required this.id,
    required this.createdAt,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.status,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      items: (json['items'] as List)
          .map((i) => OrderItem.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
      'status': status,
      'items': items.map((i) => i.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        subtotal,
        deliveryFee,
        total,
        status,
        items,
      ];
}

/// Represents an item in an order
class OrderItem extends Equatable {
  final String productId;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double totalPrice;
  final String? size;
  final List<String> addons;

  const OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.size,
    this.addons = const [],
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      size: json['size'] as String?,
      addons: json['addons'] != null
          ? List<String>.from(json['addons'] as List)
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalPrice': totalPrice,
      'size': size,
      'addons': addons,
    };
  }

  @override
  List<Object?> get props => [
        productId,
        productName,
        quantity,
        unitPrice,
        totalPrice,
        size,
        addons,
      ];
}
