import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_cart_preview_bar.g.dart';

/// Floating cart preview bar for the menu screen.
///
/// Reactive: hidden when the cart is empty, otherwise shows the last-added
/// item's thumbnail + name (ellipsis) with a "View in cart" action.
/// Tapping anywhere on the bar navigates to the cart. Designed to sit in a
/// bottom-anchored [StacPositioned] inside a [StacStack].
///
/// Purely JSON-stylable: [viewLabel]/[imageSize] control content,
/// [backgroundColor]/[textColor]/[accentColor]/[borderRadius] control the
/// look — all optional, previous defaults preserved.
@JsonSerializable(explicitToJson: true)
class StCartPreviewBar extends StacWidget {
  const StCartPreviewBar({
    this.viewLabel,
    this.imageSize,
    this.backgroundColor,
    this.textColor,
    this.accentColor,
    this.borderRadius,
  });

  final String? viewLabel;
  final double? imageSize;
  final String? backgroundColor;
  final String? textColor;
  final String? accentColor;
  final double? borderRadius;

  @override
  String get type => 'st_cart_preview_bar';

  factory StCartPreviewBar.fromJson(Map<String, dynamic> json) =>
      _$StCartPreviewBarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCartPreviewBarToJson(this);
}
