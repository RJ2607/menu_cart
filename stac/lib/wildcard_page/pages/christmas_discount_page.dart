import 'package:menu_cart/stac_runtime/actions/festive/apply_festive_offer/st_apply_festive_offer_action.dart';
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
                const StacSizedBox(height: 22),
                StacText(
                  data: data['strip'],
                  style: StacTextStyle(
                    color: '#F7D794',
                    fontSize: 18,
                    letterSpacing: 3,
                  ),
                ),
                const StacSizedBox(height: 12),
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
                const StacSizedBox(height: 20),
                StacRow(
                  children: [
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
                    const StacSizedBox(width: 10),
                    StacContainer(
                      padding: const StacEdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: StacBoxDecoration(
                        color: '#33FFFFFF',
                        borderRadius: StacBorderRadius.circular(100),
                        border: StacBorder.all(color: '#F7D794'),
                      ),
                      child: StacText(
                        data: 'Min. ₹2000',
                        style: StacTextStyle(
                          color: '#FBE7B8',
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
                    color: '#4D2929',
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
                const StacSizedBox(height: 18),
                StacRow(
                  children: [
                    StacExpanded(
                      child: _perkCard(
                        '🍰',
                        'Free plum cake',
                        'On feasts ₹2499+',
                      ),
                    ),
                    const StacSizedBox(width: 12),
                    StacExpanded(
                      child: _perkCard('🍗', 'Family platter', 'Serves 4–6'),
                    ),
                  ],
                ),
                const StacSizedBox(height: 18),
                _stepsCard(
                  const [
                    'Tap “Check festive menu” — MERRY500 auto-applies',
                    'Build a ₹2000+ feast with mains, sides & sips',
                    'Flat ₹500 comes off in cart + checkout bill',
                  ],
                  '#8F1D2C',
                  '#FFF7E8',
                ),
                const StacSizedBox(height: 18),
                _offerCode(data['code'], data['validity']),
                const StacSizedBox(height: 18),
                _teaserCard(
                  '🎄',
                  'What’s on the Christmas table?',
                  'Roast-style mains • truffle sides • berry sips',
                ),
                const StacSizedBox(height: 24),
                StMainButton(
                  title: 'Check festive menu • MERRY500',
                  color: '#8F1D2C',
                  textColor: StacColors.white,
                  onPressed: const StApplyFestiveOfferAction(
                    festiveKey: christmasDiscountPageKey,
                    navigateTo: 'menu',
                  ),
                ),
                const StacSizedBox(height: 12),
                StMainButton(
                  title: 'See Diwali offer',
                  color: '#FFF7E8',
                  textColor: '#8F1D2C',
                  borderSide: const StacBorderSide(color: '#8F1D2C'),
                  onPressed: const StWildcardPageNavAction(
                    wildcardPage: diwaliDiscountPageKey,
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
      border: StacBorder.all(color: '#E7C9A5'),
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

StacWidget _stepsCard(List<String> steps, String color, String bg) {
  return StacFractionallySizedBox(
    widthFactor: 1,
    child: StacContainer(
      padding: const StacEdgeInsets.all(18),
      decoration: StacBoxDecoration(
        color: StacColors.white,
        borderRadius: StacBorderRadius.circular(18),
        border: StacBorder.all(color: '#E7C9A5'),
      ),
      child: StacColumn(
        crossAxisAlignment: StacCrossAxisAlignment.start,
        children: [
          StacText(
            data: 'HOW THE FLAT ₹500 WORKS',
            style: StacTextStyle(
              color: color,
              fontSize: 12,
              fontWeight: StacFontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const StacSizedBox(height: 12),
          StacText(
            data: '1. ${steps[0]}',
            style: StacTextStyle(color: '#4D2929', fontSize: 14, height: 1.4),
          ),
          const StacSizedBox(height: 8),
          StacText(
            data: '2. ${steps[1]}',
            style: StacTextStyle(color: '#4D2929', fontSize: 14, height: 1.4),
          ),
          const StacSizedBox(height: 8),
          StacText(
            data: '3. ${steps[2]}',
            style: StacTextStyle(color: '#4D2929', fontSize: 14, height: 1.4),
          ),
        ],
      ),
    ),
  );
}

StacWidget _teaserCard(String emoji, String title, String subtitle) {
  return StacFractionallySizedBox(
    widthFactor: 1,
    child: StacContainer(
      padding: const StacEdgeInsets.all(16),
      decoration: StacBoxDecoration(
        color: '#2B1717',
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
