import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_size_selector.g.dart';

@JsonSerializable()
class StSizeSelector extends StacWidget {
  final String stateKey;
  final List<Map<String, dynamic>> options;
  final String? initialValue;

  const StSizeSelector({
    required this.stateKey,
    required this.options,
    this.initialValue,
  });

  @override
  String get type => 'size_selector';

  factory StSizeSelector.fromJson(Map<String, dynamic> json) =>
      _$StSizeSelectorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StSizeSelectorToJson(this);
}
