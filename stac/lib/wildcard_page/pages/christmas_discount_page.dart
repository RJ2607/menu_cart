import 'package:menu_cart/stac_runtime/actions/wildcard_page_nav/st_wildcard_page_nav.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/main_button/st_main_button.dart';
import 'package:stac/stac_core.dart';

import '../festival_discount_data.dart';

StacWidget christmasDiscountPage() {
  const data = christmasDiscountData;

  return StacScaffold(
    backgroundColor: '#FFF7E8',
    body: StacSingleChildScrollView(
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacContainer(
            padding: const StacEdgeInsets.only(
              left: 20,
              top: 52,
              right: 20,
              bottom: 36,
            ),
            decoration: StacBoxDecoration(
              gradient: StacLinearGradient(
                colors: const ['#7A1320', '#B32632'],
                begin: StacAlignment.topLeft,
                end: StacAlignment.bottomRight,
              ),
              borderRadius: const StacBorderRadius.only(
                bottomLeft: 32,
                bottomRight: 32,
              ),
            ),
            child: StacColumn(
              crossAxisAlignment: StacCrossAxisAlignment.start,
              children: [
                StacGestureDetector(
                  onTap: StacNavigator.pop(),
                  child: StacContainer(
                    padding: const StacEdgeInsets.all(9),
                    decoration: const StacBoxDecoration(
                      color: '#33FFFFFF',
                      shape: StacBoxShape.circle,
                    ),
                    child: const StacIcon(
                      icon: StacIcons.arrow_back,
                      color: StacColors.white,
                    ),
                  ),
                ),
                const StacSizedBox(height: 34),
                StacText(
                  data: data['eyebrow'],
                  style: StacTextStyle(
                    color: '#F7D794',
                    fontSize: 13,
                    fontWeight: StacFontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                const StacSizedBox(height: 10),
                StacText(
                  data: data['title'],
                  style: StacTextStyle(
                    color: StacColors.white,
                    fontSize: 34,
                    height: 1.1,
                    fontWeight: StacFontWeight.w700,
                  ),
                ),
                const StacSizedBox(height: 24),
                StacContainer(
                  padding: const StacEdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: StacBoxDecoration(
                    color: '#F7D794',
                    borderRadius: StacBorderRadius.circular(100),
                  ),
                  child: StacText(
                    data: data['discount'],
                    style: StacTextStyle(
                      color: '#7A1320',
                      fontSize: 24,
                      fontWeight: StacFontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          StacPadding(
            padding: const StacEdgeInsets.all(20),
            child: StacColumn(
              crossAxisAlignment: StacCrossAxisAlignment.start,
              children: [
                StacText(
                  data: data['description'],
                  style: StacTextStyle(
                    color: '#4D2929',
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
                const StacSizedBox(height: 24),
                _offerCode(data['code'], data['validity']),
                const StacSizedBox(height: 28),
                StMainButton(
                  title: 'Shop the Christmas menu',
                  color: '#8F1D2C',
                  textColor: StacColors.white,
                  onPressed: StacNavigator.pushStac('menu'),
                ),
                const StacSizedBox(height: 12),
                StMainButton(
                  title: 'See New Year offer',
                  color: '#FFF7E8',
                  textColor: '#8F1D2C',
                  borderSide: const StacBorderSide(color: '#8F1D2C'),
                  onPressed: const StWildcardPageNavAction(
                    wildcardPage: newYearDiscountPageKey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

StacWidget _offerCode(dynamic code, dynamic validity) {
  return StacFractionallySizedBox(
    widthFactor: 1,
    child: StacContainer(
      padding: const StacEdgeInsets.all(20),
      decoration: StacBoxDecoration(
        color: StacColors.white,
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#E7C9A5'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'USE CODE',
            style: StacTextStyle(
              color: '#8F1D2C',
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const StacSizedBox(height: 6),
          StacText(
            data: code,
            style: StacTextStyle(
              color: '#2B1717',
              fontSize: 30,
              fontWeight: StacFontWeight.w700,
            ),
          ),
          const StacSizedBox(height: 6),
          StacText(
            data: validity,
            style: StacTextStyle(color: '#7D6565', fontSize: 13),
          ),
        ],
      ),
    ),
  );
}
