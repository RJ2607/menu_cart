import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

import '../../layout/animation_config/st_animation_config.dart';

part 'st_category_chip.g.dart';

@JsonSerializable(explicitToJson: true)
class StCategoryChip extends StacWidget {
  final String category;
  final StacAnimationConfig? selectionAnimation;
  final StacAnimationConfig? pressAnimation;

  const StCategoryChip({
    required this.category,
    this.selectionAnimation,
    this.pressAnimation,
  });

  @override
  String get type => 'category_chip';

  factory StCategoryChip.fromJson(Map<String, dynamic> json) =>
      _$StCategoryChipFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCategoryChipToJson(this);
}
