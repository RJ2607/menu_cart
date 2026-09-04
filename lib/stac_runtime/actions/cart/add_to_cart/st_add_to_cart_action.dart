import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_add_to_cart_action.g.dart';

@JsonSerializable()
class StAddToCartAction extends StacAction {
  final String id;
  final String name;
  final String imageUrl;
  final double basePrice;
  final String size;
  final List<String> addons;

  const StAddToCartAction({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.basePrice,
    this.size = 'Regular',
    this.addons = const [],
  });

  @override
  String get type => 'add_to_cart';

  factory StAddToCartAction.fromJson(Map<String, dynamic> json) =>
      _$StAddToCartActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StAddToCartActionToJson(this);
}
