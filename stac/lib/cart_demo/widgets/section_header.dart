import 'package:stac/stac_core.dart';

import '../menu_data.dart';

/// Creates a section header for categories
StacWidget sectionHeader(String title) {
  return StacPadding(
    padding: const StacEdgeInsets.only(bottom: 12),
    child: StacText(
      data: title,
      style: StacTextStyle(
        fontSize: 20,
        fontWeight: StacFontWeight.w700,
        color: textPrimary,
      ),
    ),
  );
}

/// Creates a category chip
StacWidget categoryChip(String category, bool isSelected) {
  return StacContainer(
    margin: const StacEdgeInsets.only(right: 8),
    padding: const StacEdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: StacBoxDecoration(
      color: isSelected ? primaryColor : surfaceColor,
      borderRadius: StacBorderRadius.circular(20),
      border: StacBorder.all(
        color: isSelected ? primaryColor : textSecondary.withOpacity(0.2),
        width: 1,
      ),
    ),
    child: StacText(
      data: category,
      style: StacTextStyle(
        fontSize: 14,
        fontWeight: StacFontWeight.w600,
        color: isSelected ? StacColors.white : textSecondary,
      ),
    ),
  );
}
