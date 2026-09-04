import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_category_chip.g.dart';

@JsonSerializable()
class StCategoryChip extends StacWidget {
  final String category;

  const StCategoryChip({
    required this.category,
  });

  @override
  String get type => 'category_chip';

  factory StCategoryChip.fromJson(Map<String, dynamic> json) =>
      _$StCategoryChipFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StCategoryChipToJson(this);
}
