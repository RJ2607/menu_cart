import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_clear_festive_offer_action.g.dart';

/// Removes the currently applied festive campaign, if any.
///
/// Pairs with [StApplyFestiveOfferAction]: offer bars with
/// `showRemoveButton: true` dispatch this when the user taps remove.
/// [showToast] confirms the removal; [navigateTo] optionally pushes
/// 'menu'/'cart' afterwards (same values as the apply action).
@JsonSerializable(explicitToJson: true)
class StClearFestiveOfferAction extends StacAction {
  const StClearFestiveOfferAction({this.showToast = true, this.navigateTo});

  final bool showToast;
  final String? navigateTo;

  @override
  String get actionType => 'clear_festive_offer';

  factory StClearFestiveOfferAction.fromJson(Map<String, dynamic> json) =>
      _$StClearFestiveOfferActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StClearFestiveOfferActionToJson(this);
}
