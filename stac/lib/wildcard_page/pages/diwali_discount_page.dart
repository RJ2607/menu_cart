import 'package:menu_cart/stac_runtime/actions/festive/apply_festive_offer/st_apply_festive_offer_action.dart';
import 'package:menu_cart/stac_runtime/actions/wildcard_page_nav/st_wildcard_page_nav.dart';
import 'package:menu_cart/stac_runtime/widgets/controls/main_button/st_main_button.dart';
import 'package:stac/stac_core.dart';

import '../festival_discount_data.dart';

StacWidget diwaliDiscountPage() {
  const data = diwaliDiscountData;

  return StacScaffold(
    backgroundColor: '#FFF8E7',
    body: StacSingleChildScrollView(
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          // Festive header — deep plum to burnt orange, glowing gold accents.
          StacContainer(
            padding: const StacEdgeInsets.only(
              left: 20,
              top: 52,
              right: 20,
              bottom: 28,
            ),
            decoration: StacBoxDecoration(
              gradient: StacLinearGradient(
                colors: const ['#2D0A31', '#7C1D2B', '#C2570F'],
                begin: StacAlignment.topCenter,
                end: StacAlignment.bottomCenter,
              ),
              borderRadius: const StacBorderRadius.only(
                bottomLeft: 32,
                bottomRight: 32,
              ),
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
                          color: '#33FFFFFF',
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
                        color: '#FFC93C',
                        borderRadius: StacBorderRadius.circular(100),
                      ),
                      child: StacText(
                        data: '🪔 FESTIVAL OF LIGHTS',
                        style: StacTextStyle(
                          color: '#4A1500',
                          fontSize: 11,
                          fontWeight: StacFontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const StacSizedBox(height: 26),
                StacText(
                  data: '🪔  ✨  🪔  ✨  🪔',
                  style: StacTextStyle(
                    color: '#FFC93C',
                    fontSize: 20,
                    letterSpacing: 4,
                  ),
                ),
                const StacSizedBox(height: 14),
                StacText(
                  data: data['eyebrow'],
                  style: StacTextStyle(
                    color: '#FFC93C',
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
                const StacSizedBox(height: 20),
                StacRow(
                  children: [
                    StacContainer(
                      padding: const StacEdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: StacBoxDecoration(
                        color: '#FFC93C',
                        borderRadius: StacBorderRadius.circular(100),
                      ),
                      child: StacText(
                        data: data['discount'],
                        style: StacTextStyle(
                          color: '#4A1500',
                          fontSize: 24,
                          fontWeight: StacFontWeight.w700,
                        ),
                      ),
                    ),
                    const StacSizedBox(width: 10),
                    StacContainer(
                      padding: const StacEdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: StacBoxDecoration(
                        color: '#33FFFFFF',
                        borderRadius: StacBorderRadius.circular(100),
                        border: StacBorder.all(color: '#FFC93C'),
                      ),
                      child: StacText(
                        data: 'Min. ₹499',
                        style: StacTextStyle(
                          color: '#FFE9A8',
                          fontSize: 13,
                          fontWeight: StacFontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
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
                    color: '#5A3220',
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
                const StacSizedBox(height: 18),
                // Festive perks row.
                StacRow(
                  children: [
                    StacExpanded(
                      child: _perkCard('🍬', 'Free mithai', 'On orders ₹799+'),
                    ),
                    const StacSizedBox(width: 12),
                    StacExpanded(
                      child: _perkCard(
                        '🚚',
                        'Free delivery',
                        'Diwali week only',
                      ),
                    ),
                  ],
                ),
                const StacSizedBox(height: 18),
                _offerCode(data['code'], data['validity']),
                const StacSizedBox(height: 18),
                _stepsCard(const [
                  'Tap “Check festive menu” — DIWALI40 auto-applies',
                  'Add thalis, mithai & platters worth ₹499+',
                  '40% comes off in cart + checkout bill',
                ]),
                const StacSizedBox(height: 18),
                _savingsSnapshot(),
                const StacSizedBox(height: 18),
                StacText(
                  data: '🪔 ON THE FESTIVE TABLE',
                  style: StacTextStyle(
                    color: '#7C1D2B',
                    fontSize: 12,
                    fontWeight: StacFontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                const StacSizedBox(height: 10),
                StacRow(
                  children: [
                    StacExpanded(
                      child: _menuMini('🍬', 'Mithai Box', '₹249'),
                    ),
                    const StacSizedBox(width: 10),
                    StacExpanded(
                      child: _menuMini('🍛', 'Royal Thali', '₹349'),
                    ),
                    const StacSizedBox(width: 10),
                    StacExpanded(
                      child: _menuMini('🍗', 'Sharing Platter', '₹499'),
                    ),
                  ],
                ),
                const StacSizedBox(height: 18),
                _teaserCard(
                  '🍬',
                  'Festive thali picks',
                  'Mithai • sharing platters • family sides',
                ),
                const StacSizedBox(height: 24),
                StMainButton(
                  title: 'Check festive menu • DIWALI40',
                  color: '#7C1D2B',
                  textColor: StacColors.white,
                  onPressed: const StApplyFestiveOfferAction(
                    festiveKey: diwaliDiscountPageKey,
                    navigateTo: 'menu',
                  ),
                ),
                const StacSizedBox(height: 12),
                StMainButton(
                  title: 'See New Year offer',
                  color: '#FFF8E7',
                  textColor: '#7C1D2B',
                  borderSide: const StacBorderSide(color: '#7C1D2B'),
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

StacWidget _perkCard(String emoji, String title, String subtitle) {
  return StacContainer(
    padding: const StacEdgeInsets.all(14),
    decoration: StacBoxDecoration(
      color: StacColors.white,
      borderRadius: StacBorderRadius.circular(18),
      border: StacBorder.all(color: '#F0D9A8'),
    ),
    child: StacColumn(
      crossAxisAlignment: StacCrossAxisAlignment.start,
      children: [
        StacText(data: emoji, style: StacTextStyle(fontSize: 22)),
        const StacSizedBox(height: 8),
        StacText(
          data: title,
          style: StacTextStyle(
            color: '#4A1500',
            fontSize: 14,
            fontWeight: StacFontWeight.w700,
          ),
        ),
        const StacSizedBox(height: 4),
        StacText(
          data: subtitle,
          style: StacTextStyle(color: '#8A6A4A', fontSize: 12),
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
        color: StacColors.white,
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#F0D9A8'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'HOW THE 40% WORKS',
            style: StacTextStyle(
              color: '#7C1D2B',
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const StacSizedBox(height: 12),
          StacText(
            data: '1. ${steps[0]}',
            style: StacTextStyle(color: '#5A3220', fontSize: 14, height: 1.4),
          ),
          const StacSizedBox(height: 8),
          StacText(
            data: '2. ${steps[1]}',
            style: StacTextStyle(color: '#5A3220', fontSize: 14, height: 1.4),
          ),
          const StacSizedBox(height: 8),
          StacText(
            data: '3. ${steps[2]}',
            style: StacTextStyle(color: '#5A3220', fontSize: 14, height: 1.4),
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
        color: StacColors.white,
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#F0D9A8'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'SAVINGS SNAPSHOT • SAME MATH AS CART',
            style: StacTextStyle(
              color: '#7C1D2B',
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const StacSizedBox(height: 12),
          _savingsRow('₹500 thali', 'pay ₹300'),
          const StacSizedBox(height: 8),
          _savingsRow('₹1000 feast', 'pay ₹600'),
          const StacSizedBox(height: 8),
          _savingsRow('₹1500 feast', 'pay ₹900'),
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
        style: StacTextStyle(color: '#5A3220', fontSize: 14),
      ),
      StacText(
        data: pay,
        style: StacTextStyle(
          color: '#1E8E3E',
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
      color: StacColors.white,
      borderRadius: StacBorderRadius.circular(16),
      border: StacBorder.all(color: '#F0D9A8'),
    ),
    child: StacColumn(
      crossAxisAlignment: StacCrossAxisAlignment.start,
      children: [
        StacText(data: emoji, style: StacTextStyle(fontSize: 24)),
        const StacSizedBox(height: 6),
        StacText(
          data: title,
          style: StacTextStyle(
            color: '#4A1500',
            fontSize: 12,
            fontWeight: StacFontWeight.w700,
          ),
        ),
        const StacSizedBox(height: 2),
        StacText(
          data: price,
          style: StacTextStyle(
            color: '#7C1D2B',
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
        color: '#2D0A31',
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#FFC93C'),
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
                    color: StacColors.white,
                    fontSize: 15,
                    fontWeight: StacFontWeight.w700,
                  ),
                ),
                const StacSizedBox(height: 4),
                StacText(
                  data: subtitle,
                  style: StacTextStyle(color: '#E8C88A', fontSize: 13),
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
        color: '#2D0A31',
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#FFC93C'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'USE CODE',
            style: StacTextStyle(
              color: '#FFC93C',
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const StacSizedBox(height: 6),
          StacRow(
            mainAxisAlignment: StacMainAxisAlignment.spaceBetween,
            children: [
              StacText(
                data: code,
                style: StacTextStyle(
                  color: StacColors.white,
                  fontSize: 30,
                  fontWeight: StacFontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const StacIcon(icon: StacIcons.local_offer, color: '#FFC93C'),
            ],
          ),
          const StacSizedBox(height: 6),
          StacText(
            data: validity,
            style: StacTextStyle(color: '#E8C88A', fontSize: 13),
          ),
        ],
      ),
    ),
  );
}
