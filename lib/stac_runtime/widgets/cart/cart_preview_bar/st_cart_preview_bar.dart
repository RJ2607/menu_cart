import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

import '../../layout/animation_config/st_animation_config.dart';

part 'st_cart_preview_bar.g.dart';

@JsonSerializable(explicitToJson: true)
class StCartPreviewBar extends StacWidget {
  const StCartPreviewBar({
    this.viewLabel,
    this.imageSize,
    this.backgroundColor,
    this.textColor,
    this.accentColor,
    this.borderRadius,
    this.previewAnimation,
  });

  final String? viewLabel;
  final double? imageSize;
  final String? backgroundColor;
  final String? textColor;
  final String? accentColor;
  final double? borderRadius;
  final StacAnimationConfig? previewAnimation;

  @override
  String get type => 'st_cart_preview_bar';

  factory StCartPreviewBar.fromJson(Map<String, dynamic> json) =>
      _$StCartPreviewBarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCartPreviewBarToJson(this);
}
