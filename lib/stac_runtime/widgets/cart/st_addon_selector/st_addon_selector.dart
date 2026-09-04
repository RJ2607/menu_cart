import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_addon_selector.g.dart';

@JsonSerializable()
class StAddonSelector extends StacWidget {
  final String stateKey;
  final List<Map<String, dynamic>> options;
  final List<String>? initialSelected;

  const StAddonSelector({
    required this.stateKey,
    required this.options,
    this.initialSelected,
  });

  @override
  String get type => 'addon_selector';

  factory StAddonSelector.fromJson(Map<String, dynamic> json) =>
      _$StAddonSelectorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StAddonSelectorToJson(this);
}
