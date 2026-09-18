import 'festive_offer.dart';

/// Single source of truth for all festive campaigns.
///
/// TO ADD A NEW FESTIVAL: copy one entry, change key/code/type/value/min.
/// Cart totals, the offer bar, checkout dialog and pitch JSON pick it up
/// automatically. Then add the wildcard child + home card in `stac/lib/`.
const Map<String, FestiveOffer> festiveOffers = {
  'christmas_discount': FestiveOffer(
    key: 'christmas_discount',
    name: 'Christmas',
    code: 'MERRY500',
    discountType: FestiveDiscountType.flat,
    value: 500,
    minOrderSubtotal: 2000,
    currencySymbol: '₹',
    themeColor: '#8F1D2C',
    accentColor: '#F7D794',
    badgeLabel: '₹500 OFF',
  ),
  'new_year_discount': FestiveOffer(
    key: 'new_year_discount',
    name: 'New Year',
    code: 'HELLO30',
    discountType: FestiveDiscountType.percent,
    value: 30,
    minOrderSubtotal: 699,
    currencySymbol: '₹',
    themeColor: '#173B58',
    accentColor: '#C9FF49',
    badgeLabel: '30% OFF',
  ),
  'diwali_discount': FestiveOffer(
    key: 'diwali_discount',
    name: 'Diwali',
    code: 'DIWALI40',
    discountType: FestiveDiscountType.percent,
    value: 40,
    minOrderSubtotal: 499,
    currencySymbol: '₹',
    themeColor: '#7C1D2B',
    accentColor: '#FFC93C',
    badgeLabel: '40% OFF',
  ),
};
