import 'package:menu_cart/stac_runtime/actions/wildcard_page_nav/st_wildcard_page_nav.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/main_button/st_main_button.dart';
import 'package:stac/stac_core.dart';

import '../festival_discount_data.dart';

StacWidget newYearDiscountPage() {
  const data = newYearDiscountData;

  return StacScaffold(
    backgroundColor: '#07111F',
    body: StacSingleChildScrollView(
      child: StacPadding(
        padding: const StacEdgeInsets.only(
          left: 20,
          top: 52,
          right: 20,
          bottom: 28,
        ),
        child: StacColumn(
          crossAxisAlignment: StacCrossAxisAlignment.start,
          children: [
            StacRow(
              mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
              children: [
                StacGestureDetector(
                  onTap: StacNavigator.pop(),
                  child: StacContainer(
                    padding: const StacEdgeInsets.all(9),
                    decoration: const StacBoxDecoration(
                      color: '#16283D',
                      shape: StacBoxShape.circle,
                    ),
                    child: const StacIcon(
                      icon: StacIcons.arrow_back,
                      color: StacColors.white,
                    ),
                  ),
                ),
                StacContainer(
                  padding: const StacEdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 7,
                  ),
                  decoration: StacBoxDecoration(
                    color: '#C9FF49',
                    borderRadius: StacBorderRadius.circular(100),
                  ),
                  child: StacText(
                    data: 'LIMITED DROP',
                    style: StacTextStyle(
                      color: '#07111F',
                      fontSize: 11,
                      fontWeight: StacFontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            const StacSizedBox(height: 56),
            StacText(
              data: data['eyebrow'],
              style: StacTextStyle(
                color: '#68D7FF',
                fontSize: 13,
                fontWeight: StacFontWeight.w700,
                letterSpacing: 2.5,
              ),
            ),
            const StacSizedBox(height: 12),
            StacText(
              data: data['title'],
              style: StacTextStyle(
                color: StacColors.white,
                fontSize: 38,
                height: 1.05,
                fontWeight: StacFontWeight.w700,
              ),
            ),
            const StacSizedBox(height: 34),
            StacFractionallySizedBox(
              widthFactor: 1,
              child: StacContainer(
                padding: const StacEdgeInsets.all(24),
                decoration: StacBoxDecoration(
                  gradient: StacLinearGradient(
                    colors: const ['#173B58', '#102438'],
                    begin: StacAlignment.topLeft,
                    end: StacAlignment.bottomRight,
                  ),
                  borderRadius: StacBorderRadius.circular(24),
                  border: StacBorder.all(color: '#2C5875'),
                ),
                child: StacColumn(
                  crossAxisAlignment: StacCrossAxisAlignment.start,
                  children: [
                    StacText(
                      data: data['discount'],
                      style: StacTextStyle(
                        color: '#C9FF49',
                        fontSize: 42,
                        fontWeight: StacFontWeight.w700,
                      ),
                    ),
                    const StacSizedBox(height: 14),
                    StacText(
                      data: data['description'],
                      style: StacTextStyle(
                        color: '#D6E8F2',
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const StacSizedBox(height: 24),
                    StacContainer(
                      padding: const StacEdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: StacBoxDecoration(
                        color: '#07111F',
                        borderRadius: StacBorderRadius.circular(12),
                      ),
                      child: StacRow(
                        mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
                        children: [
                          StacText(
                            data: data['code'],
                            style: StacTextStyle(
                              color: StacColors.white,
                              fontSize: 23,
                              fontWeight: StacFontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const StacIcon(
                            icon: StacIcons.local_offer,
                            color: '#C9FF49',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const StacSizedBox(height: 14),
            StacText(
              data: data['validity'],
              style: StacTextStyle(color: '#8FAABC', fontSize: 13),
            ),
            const StacSizedBox(height: 32),
            StMainButton(
              title: 'Order for the new year',
              color: '#C9FF49',
              textColor: '#07111F',
              onPressed: StacNavigator.pushStac('menu'),
            ),
            const StacSizedBox(height: 12),
            StMainButton(
              title: 'See Christmas offer',
              color: '#07111F',
              textColor: StacColors.white,
              borderSide: const StacBorderSide(color: '#68D7FF'),
              onPressed: const StWildcardPageNavAction(
                wildcardPage: christmasDiscountPageKey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
