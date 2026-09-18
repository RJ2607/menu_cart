import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac_core.dart';

part 'st_apply_festive_offer_action.g.dart';

/// Applies a festive campaign ([festiveKey]) then optionally navigates.
///
/// [festiveKey] must match a key in `festiveOffers` (e.g.
/// 'diwali_discount') — that registry is the only place a future festival
/// needs to be added for pricing/checkout to pick it up.
/// Set [openWildcardPage] to also open that wildcard child (thematic
/// takeover), or [navigateTo] ('menu'/'cart') for a plain route push.
@JsonSerializable(explicitToJson: true)
class StApplyFestiveOfferAction extends StacAction {
  const StApplyFestiveOfferAction({
    required this.festiveKey,
    this.navigateTo,
    this.openWildcardPage,
    this.showToast = true,
  });

  final String festiveKey;
  final String? navigateTo;
  final String? openWildcardPage;
  final bool showToast;

  @override
  String get actionType => 'apply_festive_offer';

  factory StApplyFestiveOfferAction.fromJson(Map<String, dynamic> json) =>
      _$StApplyFestiveOfferActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StApplyFestiveOfferActionToJson(this);
}
