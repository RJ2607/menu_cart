import 'package:flutter/material.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_addon_selector/addon_selector.dart';
import 'package:stac/stac.dart';

import 'st_addon_selector.dart';

class StAddonSelectorParser extends StacParser<StAddonSelector> {
  const StAddonSelectorParser();

  @override
  String get type => 'addon_selector';

  @override
  StAddonSelector getModel(Map<String, dynamic> json) =>
      StAddonSelector.fromJson(json);

  @override
  Widget parse(BuildContext context, StAddonSelector model) {
    return AddonSelector(
      options: model.options,
      stateKey: model.stateKey,
      initialSelected: model.initialSelected,
    );
  }
}
