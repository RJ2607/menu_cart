/// Menu data for Urban Bites food demo.
///
/// LIVE EDIT TARGET: Change `featuredItemId` or `availability` to demonstrate
/// hot-reload during presentation.
library;

// Brand identity
const String brandName = 'Urban Bites';
const String brandTagline = 'Fresh Street Food, Elevated';

// LIVE EDIT: Toggle featured item or change promo text
const String featuredItemId = 'burger_classic';
const String promoText = '🎉 Free delivery on orders over \$25';

// Theme colors (warm palette)
const String primaryColor = '#FF6B35';
const String accentColor = '#F7931E';
const String surfaceColor = '#FFF8F3';
const String cardColor = '#FFFFFF';
const String textPrimary = '#2D3436';
const String textSecondary = '#636E72';

/// Food item model
class MenuItem {
  final String id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String imageUrl;
  final bool isVegetarian;
  final bool isAvailable;
  final bool isFeatured;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.isVegetarian = false,
    this.isAvailable = true,
    this.isFeatured = false,
  });
}

/// Category definitions
const List<String> categories = ['Mains', 'Sides', 'Drinks'];

/// Menu items (6 items across 3 categories)
final List<MenuItem> menuItems = [
  // Mains
  const MenuItem(
    id: 'burger_classic',
    name: 'Classic Urban Burger',
    description: 'Grass-fed beef, cheddar, pickles, special sauce',
    category: 'Mains',
    price: 12.99,
    imageUrl:
        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800&fm=jpg',
    isVegetarian: false,
    isAvailable: true,
    isFeatured: true,
  ),
  const MenuItem(
    id: 'wrap_chicken',
    name: 'Grilled Chicken Wrap',
    description: 'Herb-marinated chicken, greens, chipotle mayo',
    category: 'Mains',
    price: 10.99,
    imageUrl:
        'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800&fm=jpg',
    isVegetarian: false,
    isAvailable: true,
  ),
  // LIVE EDIT: Change isAvailable to false to show disabled state
  const MenuItem(
    id: 'bowl_veggie',
    name: 'Mediterranean Bowl',
    description: 'Quinoa, roasted veggies, falafel, tahini drizzle',
    category: 'Mains',
    price: 11.49,
    imageUrl:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&fm=jpg',
    isVegetarian: true,
    isAvailable: false,
  ),
  // Sides
  const MenuItem(
    id: 'fries_truffle',
    name: 'Truffle Parmesan Fries',
    description: 'Hand-cut fries with truffle oil and parmesan',
    category: 'Sides',
    price: 5.99,
    imageUrl:
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=800&fm=jpg',
    isVegetarian: true,
    isAvailable: true,
  ),
  // Drinks
  const MenuItem(
    id: 'lemonade_fresh',
    name: 'Fresh Mint Lemonade',
    description: 'House-made lemonade with fresh mint',
    category: 'Drinks',
    price: 3.99,
    imageUrl:
        'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=800',
    isVegetarian: true,
    isAvailable: true,
  ),
  const MenuItem(
    id: 'smoothie_berry',
    name: 'Berry Blast Smoothie',
    description: 'Mixed berries, banana, Greek yogurt',
    category: 'Drinks',
    price: 6.49,
    imageUrl:
        'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800&fm=jpg',
    isVegetarian: true,
    isAvailable: true,
  ),
];

/// Get items by category
List<MenuItem> getItemsByCategory(String category) {
  return menuItems.where((item) => item.category == category).toList();
}

/// Get item by ID
MenuItem? getItemById(String id) {
  try {
    return menuItems.firstWhere((item) => item.id == id);
  } catch (_) {
    return null;
  }
}

/// Size options for detail screen
const List<Map<String, dynamic>> sizeOptions = [
  {'label': 'Regular', 'price': 0.0},
  {'label': 'Large', 'price': 2.5},
];

/// Add-on options for detail screen
const List<Map<String, dynamic>> addonOptions = [
  {'label': 'Extra Cheese', 'price': 1.5},
  {'label': 'Bacon', 'price': 2.0},
  {'label': 'Avocado', 'price': 2.5},
];

/// Seeded cart items for demo
final List<Map<String, dynamic>> seededCartItems = [];

/// Cart calculations
const double deliveryFee = 3.99;

double calculateSubtotal(List<Map<String, dynamic>> items) {
  return items.fold(0.0, (sum, item) {
    final price = item['price'] as double;
    final quantity = item['quantity'] as int;
    return sum + (price * quantity);
  });
}

double calculateTotal(List<Map<String, dynamic>> items) {
  return calculateSubtotal(items) + deliveryFee;
}
