import 'package:menu_cart/core/festive/festive_offers.dart';

const String christmasDiscountPageKey = 'christmas_discount';
const String newYearDiscountPageKey = 'new_year_discount';
const String diwaliDiscountPageKey = 'diwali_discount';

const Map<String, dynamic> christmasDiscountData = {
  'eyebrow': 'CHRISTMAS FEAST',
  'title': 'Share more joy at the table',
  'discount': '₹500 OFF',
  'description':
      'Flat ₹500 off your Christmas feast when your food total reaches ₹2000. Use code MERRY500 at checkout — discounts auto-apply in the cart.',
  'code': 'MERRY500',
  'validity': 'Valid through December 25 • Min. food total ₹2000',
  'emoji': '🎄',
  'strip': '❄️  ☃️  🎁  ❄️  ☃️  🎁  ❄️',
  'perks': [
    {'emoji': '🍰', 'title': 'Free plum cake', 'subtitle': 'On feasts ₹2499+'},
    {'emoji': '🍗', 'title': 'Family platter', 'subtitle': 'Serves 4–6'},
  ],
  'steps': [
    'Tap “Check festive menu” — MERRY500 auto-applies',
    'Build a ₹2000+ feast with mains, sides & sips',
    'Flat ₹500 comes off in cart + checkout bill',
  ],
  'teaserTitle': 'What’s on the Christmas table?',
  'teaserSubtitle': 'Roast-style mains • truffle sides • berry sips',
};

const Map<String, dynamic> newYearDiscountData = {
  'eyebrow': 'NEW YEAR DROP',
  'title': 'Start fresh. Eat bold.',
  'discount': '30% OFF',
  'description':
      'Take 30% off your first Urban Bites order of the new year. Minimum food total ₹699.',
  'code': 'HELLO30',
  'validity': 'Valid January 1 through January 7',
  'emoji': '🎆',
  'strip': '✨  🎆  ✨  🥂  ✨  🎆  ✨',
  'perks': [
    {'emoji': '🚚', 'title': 'Free delivery', 'subtitle': 'First Jan order'},
    {'emoji': '🥗', 'title': 'Fresh bowls', 'subtitle': 'New-year specials'},
  ],
  'steps': [
    'Tap “Check festive menu” — HELLO30 auto-applies',
    'Fill your cart to ₹699+ with bold new picks',
    '30% comes off in cart + checkout bill',
  ],
  'teaserTitle': 'Midnight countdown picks',
  'teaserSubtitle': 'Protein bowls • grilled wraps • fresh sips',
};

const Map<String, dynamic> diwaliDiscountData = {
  'eyebrow': 'DIWALI • FESTIVAL OF LIGHTS',
  'title': 'Light up your feast this Diwali',
  'discount': '40% OFF',
  'description':
      'Celebrate with mithai, festive thalis, and sharing platters. Get 40% off when your food total reaches ₹499.',
  'code': 'DIWALI40',
  'validity': 'Valid October 18 through October 24',
  'emoji': '🪔',
  'strip': '🪔  ✨  🪔  ✨  🪔  ✨  🪔',
  'perks': [
    {'emoji': '🍬', 'title': 'Free mithai', 'subtitle': 'On orders ₹799+'},
    {'emoji': '🚚', 'title': 'Free delivery', 'subtitle': 'Diwali week only'},
  ],
  'steps': [
    'Tap “Check festive menu” — DIWALI40 auto-applies',
    'Add thalis, mithai & platters worth ₹499+',
    '40% comes off in cart + checkout bill',
  ],
  'teaserTitle': 'Festive thali picks',
  'teaserSubtitle': 'Mithai • sharing platters • family sides',
};

/// All festive keys, in home-card order. New festivals append here.
const List<String> allFestiveKeys = [
  christmasDiscountPageKey,
  newYearDiscountPageKey,
  diwaliDiscountPageKey,
];

/// Badge labels sourced from the pricing registry (single source of truth).
String festiveBadge(String key) => festiveOffers[key]?.badgeLabel ?? '';
