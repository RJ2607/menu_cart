import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_add_to_cart_button.g.dart';

/// Data model for the "st_add_to_cart_button" Stac widget type.
/// This button adds the current item with selected options to the cart.
@JsonSerializable(explicitToJson: true)
class AddToCartButton extends StacWidget {
  final String stateKey;
  final String itemId;
  final String itemName;
  final String itemImageUrl;
  final double itemBasePrice;
  final String buttonText;

  const AddToCartButton({
    required this.stateKey,
    required this.itemId,
    required this.itemName,
    required this.itemImageUrl,
    required this.itemBasePrice,
    this.buttonText = 'Add to Cart',
  });

  @override
  String get type => 'st_add_to_cart_button';

  factory AddToCartButton.fromJson(Map<String, dynamic> json) =>
      _$AddToCartButtonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddToCartButtonToJson(this);
}
