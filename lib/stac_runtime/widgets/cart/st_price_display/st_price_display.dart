import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_price_display.g.dart';

@JsonSerializable()
class StPriceDisplay extends StacWidget {
  final String stateKey;
  final double basePrice;
  final Map<String, double>? sizePrices;
  final Map<String, double>? addonPrices;

  const StPriceDisplay({
    required this.stateKey,
    required this.basePrice,
    this.sizePrices,
    this.addonPrices,
  });

  @override
  String get type => 'price_display';

  factory StPriceDisplay.fromJson(Map<String, dynamic> json) =>
      _$StPriceDisplayFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StPriceDisplayToJson(this);
}
