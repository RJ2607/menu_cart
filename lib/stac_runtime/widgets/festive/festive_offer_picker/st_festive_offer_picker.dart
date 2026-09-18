import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_festive_offer_picker.g.dart';

/// Server-driven festive offer picker for the cart screen.
///
/// Renders every offer in the festive registry as a tappable chip showing
/// its badge + code. Tapping a chip dispatches `apply_festive_offer`; the
/// active offer renders highlighted. Future festivals appear automatically —
/// no JSON changes needed. Pair with [FestiveOfferBar] (status + remove).
///
/// Purely JSON-stylable: [title]/[showCodes] control content, [spacing]
/// controls chip gaps, [borderRadius] controls chip shape.
@JsonSerializable(explicitToJson: true)
class FestiveOfferPicker extends StacWidget {
  const FestiveOfferPicker({this.title, this.showCodes = true, this.spacing, this.borderRadius});

  final String? title;
  final bool showCodes;
  final double? spacing;
  final double? borderRadius;

  @override
  String get type => 'st_festive_offer_picker';

  factory FestiveOfferPicker.fromJson(Map<String, dynamic> json) =>
      _$FestiveOfferPickerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FestiveOfferPickerToJson(this);
}
