import 'package:menu_cart/stac_runtime/actions/festive/apply_festive_offer/st_apply_festive_offer_action.dart';
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
              data: '✨  🎆  ✨  🥂  ✨  🎆  ✨',
              style: StacTextStyle(
                color: '#C9FF49',
                fontSize: 18,
                letterSpacing: 3,
              ),
            ),
            const StacSizedBox(height: 14),
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
            const StacSizedBox(height: 18),
            StacRow(
              children: [
                StacExpanded(
                  child: _perkCard(
                    '🚚',
                    'Free delivery',
                    'First Jan order',
                    '#173B58',
                    '#0E2233',
                  ),
                ),
                const StacSizedBox(width: 12),
                StacExpanded(
                  child: _perkCard(
                    '🥗',
                    'Fresh bowls',
                    'New-year specials',
                    '#173B58',
                    '#0E2233',
                  ),
                ),
              ],
            ),
            const StacSizedBox(height: 14),
            _stepsCard(const [
              'Tap “Check festive menu” — HELLO30 auto-applies',
              'Fill your cart to ₹699+ with bold new picks',
              '30% comes off in cart + checkout bill',
            ]),
            const StacSizedBox(height: 14),
            _savingsSnapshot(),
            const StacSizedBox(height: 14),
            StacText(
              data: '🎆 ON THE COUNTDOWN TABLE',
              style: StacTextStyle(
                color: '#C9FF49',
                fontSize: 12,
                fontWeight: StacFontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
            const StacSizedBox(height: 10),
            StacRow(
              children: [
                StacExpanded(child: _menuMini('🥗', 'Power Bowl', '₹239')),
                const StacSizedBox(width: 10),
                StacExpanded(child: _menuMini('🌯', 'Grill Wrap', '₹229')),
                const StacSizedBox(width: 10),
                StacExpanded(child: _menuMini('🥤', 'Fresh Sip', '₹99')),
              ],
            ),
            const StacSizedBox(height: 14),
            _teaserCard(
              '🎆',
              'Midnight countdown picks',
              'Protein bowls • grilled wraps • fresh sips',
            ),
            const StacSizedBox(height: 28),
            StMainButton(
              title: 'Check festive menu • HELLO30',
              color: '#C9FF49',
              textColor: '#07111F',
              onPressed: const StApplyFestiveOfferAction(
                festiveKey: newYearDiscountPageKey,
                navigateTo: 'menu',
              ),
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

StacWidget _perkCard(
  String emoji,
  String title,
  String subtitle,
  String bg,
  String border,
) {
  return StacContainer(
    padding: const StacEdgeInsets.all(14),
    decoration: StacBoxDecoration(
      color: bg,
      borderRadius: StacBorderRadius.circular(18),
      border: StacBorder.all(color: border),
    ),
    child: StacColumn(
      crossAxisAlignment: StacCrossAxisAlignment.start,
      children: [
        StacText(data: emoji, style: StacTextStyle(fontSize: 22)),
        const StacSizedBox(height: 8),
        StacText(
          data: title,
          style: StacTextStyle(
            color: StacColors.white,
            fontSize: 14,
            fontWeight: StacFontWeight.w700,
          ),
        ),
        const StacSizedBox(height: 4),
        StacText(
          data: subtitle,
          style: StacTextStyle(color: '#8FAABC', fontSize: 12),
        ),
      ],
    ),
  );
}

StacWidget _stepsCard(List<String> steps) {
  return StacFractionallySizedBox(
    widthFactor: 1,
    child: StacContainer(
      padding: const StacEdgeInsets.all(18),
      decoration: StacBoxDecoration(
        gradient: StacLinearGradient(
          colors: const ['#173B58', '#102438'],
          begin: StacAlignment.topLeft,
          end: StacAlignment.bottomRight,
        ),
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#2C5875'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'HOW THE 30% WORKS',
            style: StacTextStyle(
              color: '#C9FF49',
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const StacSizedBox(height: 12),
          StacText(
            data: '1. ${steps[0]}',
            style: StacTextStyle(color: '#D6E8F2', fontSize: 14, height: 1.4),
          ),
          const StacSizedBox(height: 8),
          StacText(
            data: '2. ${steps[1]}',
            style: StacTextStyle(color: '#D6E8F2', fontSize: 14, height: 1.4),
          ),
          const StacSizedBox(height: 8),
          StacText(
            data: '3. ${steps[2]}',
            style: StacTextStyle(color: '#D6E8F2', fontSize: 14, height: 1.4),
          ),
        ],
      ),
    ),
  );
}

StacWidget _savingsSnapshot() {
  return StacFractionallySizedBox(
    widthFactor: 1,
    child: StacContainer(
      padding: const StacEdgeInsets.all(18),
      decoration: StacBoxDecoration(
        gradient: StacLinearGradient(
          colors: const ['#173B58', '#102438'],
          begin: StacAlignment.topLeft,
          end: StacAlignment.bottomRight,
        ),
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#C9FF49'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'SAVINGS SNAPSHOT • SAME 30% AS CART',
            style: StacTextStyle(
              color: '#C9FF49',
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const StacSizedBox(height: 12),
          _savingsRow('₹700 cart', 'pay ₹490'),
          const StacSizedBox(height: 8),
          _savingsRow('₹1000 cart', 'pay ₹700'),
          const StacSizedBox(height: 8),
          _savingsRow('₹1500 cart', 'pay ₹1050'),
        ],
      ),
    ),
  );
}

StacWidget _savingsRow(String cart, String pay) {
  return StacRow(
    mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
    children: [
      StacText(
        data: cart,
        style: StacTextStyle(color: '#D6E8F2', fontSize: 14),
      ),
      StacText(
        data: pay,
        style: StacTextStyle(
          color: '#C9FF49',
          fontSize: 14,
          fontWeight: StacFontWeight.w700,
        ),
      ),
    ],
  );
}

StacWidget _menuMini(String emoji, String title, String price) {
  return StacContainer(
    padding: const StacEdgeInsets.all(12),
    decoration: StacBoxDecoration(
      color: '#173B58',
      borderRadius: StacBorderRadius.circular(16),
      border: StacBorder.all(color: '#0E2233'),
    ),
    child: StacColumn(
      crossAxisAlignment: StacCrossAxisAlignment.start,
      children: [
        StacText(data: emoji, style: StacTextStyle(fontSize: 24)),
        const StacSizedBox(height: 6),
        StacText(
          data: title,
          style: StacTextStyle(
            color: StacColors.white,
            fontSize: 12,
            fontWeight: StacFontWeight.w700,
          ),
        ),
        const StacSizedBox(height: 2),
        StacText(
          data: price,
          style: StacTextStyle(
            color: '#C9FF49',
            fontSize: 13,
            fontWeight: StacFontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

StacWidget _teaserCard(String emoji, String title, String subtitle) {
  return StacFractionallySizedBox(
    widthFactor: 1,
    child: StacContainer(
      padding: const StacEdgeInsets.all(16),
      decoration: StacBoxDecoration(
        color: '#C9FF49',
        borderRadius: StacBorderRadius.circular(18),
      ),
      child: StacRow(
        children: [
          StacText(data: emoji, style: StacTextStyle(fontSize: 30)),
          const StacSizedBox(width: 12),
          StacExpanded(
            child: StacColumn(
              crossAxisAlignment: StacCrossAxisAlignment.start,
              children: [
                StacText(
                  data: title,
                  style: StacTextStyle(
                    color: '#07111F',
                    fontSize: 15,
                    fontWeight: StacFontWeight.w700,
                  ),
                ),
                const StacSizedBox(height: 4),
                StacText(
                  data: subtitle,
                  style: StacTextStyle(color: '#2A3F1A', fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
