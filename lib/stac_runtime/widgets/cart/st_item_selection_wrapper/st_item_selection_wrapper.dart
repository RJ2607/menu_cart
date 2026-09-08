import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_item_selection_wrapper.g.dart';

/// Wrapper widget that manages the lifecycle of an [ItemSelectionController].
/// Initialize this at the top of item detail screens.
/// Child widgets (size selector, addon selector, price display) find
/// the controller via Get.find with the same stateKey tag.
@JsonSerializable()
class StItemSelectionWrapper extends StacWidget {
  final String stateKey;
  final String initialSize;
  final List<String> initialAddons;
  final StacWidget child;

  const StItemSelectionWrapper({
    required this.stateKey,
    this.initialSize = 'Regular',
    this.initialAddons = const [],
    required this.child,
  });

  @override
  String get type => 'item_selection_wrapper';

  factory StItemSelectionWrapper.fromJson(Map<String, dynamic> json) =>
      _$StItemSelectionWrapperFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StItemSelectionWrapperToJson(this);
}
