import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_dynamic_cart_list.g.dart';

/// Data model for the "st_dynamic_cart_list" Stac widget type.
/// Displays cart items dynamically from CartController.
@JsonSerializable(explicitToJson: true)
class DynamicCartList extends StacWidget {
  const DynamicCartList();

  @override
  String get type => 'st_dynamic_cart_list';

  factory DynamicCartList.fromJson(Map<String, dynamic> json) =>
      _$DynamicCartListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DynamicCartListToJson(this);
}
