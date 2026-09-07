import 'package:flutter/material.dart';
import 'package:stac/stac.dart';

import 'st_filtered_menu_items.dart';

class FilteredMenuItemsParser extends StacParser<FilteredMenuItems> {
  const FilteredMenuItemsParser();

  @override
  String get type => 'filtered_menu_items';

  @override
  FilteredMenuItems getModel(Map<String, dynamic> json) =>
      FilteredMenuItems.fromJson(json);

  @override
  Widget parse(BuildContext context, FilteredMenuItems model) {
    return model.child?.parse(context) ?? const SizedBox.shrink();
  }
}
