# 🍔 Urban Bites - Menu Cart Demo App

A **production-ready demo application** showcasing the [Smoketrees App Template](https://github.com/smoke-trees/smoketrees_app_template) with fully stateful STAC (Server-driven UI) implementation.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![STAC](https://img.shields.io/badge/STAC-Powered-FF6B35)](https://github.com/smoke-trees/st_sdui)
[![GetX](https://img.shields.io/badge/State-GetX-purple)](https://pub.dev/packages/get)

> **Demo Purpose:** Demonstrates how to build fully interactive, stateful server-driven UI screens using the Smoketrees template architecture.

---

## 🎯 Demo Highlights

This app demonstrates **best practices** for building production apps with the Smoketrees template:

### ✨ Key Features Showcased

#### 🎨 **Fully Stateful STAC Screens**
- ✅ **Interactive UI** - All buttons, chips, and checkboxes respond to user input
- ✅ **Real-time Updates** - State changes trigger instant UI updates
- ✅ **Dynamic Calculations** - Prices recalculate automatically based on selections
- ✅ **Visual Feedback** - Color changes, animations, and transitions

#### 🏗️ **Architecture Patterns**
- ✅ **Custom STAC Widgets** - Reusable stateful components
- ✅ **Custom STAC Actions** - Type-safe action handlers
- ✅ **GetX State Management** - Reactive state with minimal boilerplate
- ✅ **Clean Separation** - STAC DSL for UI, Dart for business logic

#### 🚀 **Production Features**
- ✅ **Live Cart Badge** - Updates count across all screens
- ✅ **Category Filtering** - Interactive chips with state persistence
- ✅ **Size Selection** - Toggle between options with visual feedback
- ✅ **Addon Management** - Multi-select checkboxes with price updates
- ✅ **Swipe to Delete** - Dismissible cart items with confirmation

---

## 📱 Demo Screens

### 1. Menu Screen
**File:** `stac/lib/cart_demo/menu_screen.dart`

**Features:**
- 🛒 **Live Cart Badge** - Shows real-time item count
- 🏷️ **Category Chips** - Filter menu by All/Mains/Sides/Drinks
- 🎨 **Beautiful Food Cards** - Tap to view item details
- 📦 **Promotional Banner** - Gradient header with call-to-action

**Stateful Components:**
```dart
StCartBadge(              // Updates automatically
  iconColor: textPrimary,
  badgeColor: primaryColor,
  onTap: StacNavigator.pushStac('cart'),
)

StCategoryChip(           // Interactive filtering
  category: 'Mains',
)
```

### 2. Item Detail Screen
**File:** `stac/lib/cart_demo/item_detail_screen.dart`

**Features:**
- 📏 **Size Selector** - Choose Regular or Large
- 🧀 **Addon Selector** - Multi-select extras (cheese, bacon, avocado)
- 💰 **Dynamic Price** - Recalculates based on selections
- ❤️ **Favorite Toggle** - Animated heart icon
- 🖼️ **Hero Image** - Full-width product photo

**Stateful Components:**
```dart
StPriceDisplay(           // Real-time price calculation
  stateKey: 'item_detail_main',
  basePrice: 12.99,
  sizePrices: {'Large': 2.5},
  addonPrices: {'Extra Cheese': 1.5, 'Bacon': 2.0},
)

StSizeSelector(           // Interactive size buttons
  stateKey: 'item_detail_main',
  options: sizeOptions,
)

StAddonSelector(          // Multi-select checkboxes
  stateKey: 'item_detail_main',
  options: addonOptions,
)
```

### 3. Cart Screen
**File:** `stac/lib/cart_demo/cart_screen.dart`

**Features:**
- 🗑️ **Swipe to Delete** - Dismissible items with confirmation
- ➕➖ **Quantity Controls** - Increment/decrement with +/- buttons
- 💵 **Order Summary** - Subtotal, delivery fee, and total
- 📦 **Empty State** - Beautiful illustration when cart is empty

---

## 🏛️ Architecture

### Project Structure

```
menu_cart/
├── lib/                              # Main Flutter app
│   ├── features/
│   │   └── cart/
│   │       ├── cart_controller.dart           # Cart state (GetX)
│   │       └── item_selection_controller.dart # Item selection state
│   ├── stac_runtime/
│   │   ├── widgets/cart/                      # Custom STAC widgets
│   │   │   ├── st_cart_badge/                # Live cart badge
│   │   │   ├── st_category_chip/             # Category filter
│   │   │   ├── st_size_selector/             # Size selection
│   │   │   ├── st_addon_selector/            # Addon checkboxes
│   │   │   └── st_price_display/             # Dynamic price
│   │   ├── actions/cart/                      # Custom STAC actions
│   │   └── stac_registry.dart                # Parser registration
│   └── app/
│       ├── init_bindings.dart                # Dependency injection
│       └── app_pages.dart                    # Route configuration
│
├── stac/                             # STAC DSL definitions
│   └── lib/cart_demo/
│       ├── menu_screen.dart          # Menu UI (STAC DSL)
│       ├── item_detail_screen.dart   # Item detail UI (STAC DSL)
│       └── cart_screen.dart          # Cart UI (STAC DSL)
│
└── example/                          # Reference implementation
    └── (Smoketrees template example code)
```

### Data Flow

```
STAC DSL (Declarative UI)
  ↓ (compile with: stac build)
JSON Screens
  ↓ (parsed at runtime)
StacParser → Flutter Widgets
  ↓
Custom Widgets with Obx()
  ↓
GetX Controllers (State)
  ↓
User Interaction → State Change
  ↓
Obx() Rebuilds UI (Reactive)
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter 3.x or higher
- Dart 3.x or higher
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/RJ2607/menu_cart.git
   cd menu_cart
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Build STAC screens**
   ```bash
   cd stac
   stac build
   cd ..
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 🎮 Interactive Demo Walkthrough

### Test All Stateful Features

#### On Menu Screen:
1. **Cart Badge** → Look at top-right corner, shows "3" (seeded data)
2. **Category Chips** → Click "Mains" → Chip highlights orange
3. **Category Chips** → Click "Drinks" → Previous unhighlights, Drinks highlights
4. **Food Cards** → Tap "Classic Urban Burger" → Navigates to detail screen

#### On Item Detail Screen:
1. **Size Selection:**
   - "Regular" is highlighted (orange background)
   - Click "Large" → Button turns orange, price changes to **$15.49**
   - Click "Regular" again → Reverts to **$12.99**

2. **Addon Selection:**
   - "Extra Cheese" checkbox is checked by default
   - Click "Bacon" → Checkbox checks, price adds **$2.00**
   - Click "Avocado" → Checkbox checks, price adds **$2.50**
   - Click "Extra Cheese" again → Unchecks, price decreases **$1.50**

3. **Dynamic Price:**
   - Select "Large" + "Extra Cheese" + "Bacon" + "Avocado"
   - Price becomes: **$12.99 + $2.50 + $1.50 + $2.00 + $2.50 = $21.49**

4. **Favorite Toggle:**
   - Click heart icon → Animates from outline to filled

#### On Cart Screen:
1. **Quantity Controls:**
   - Click "+" on any item → Quantity increases, total updates
   - Click "-" → Quantity decreases, total updates

2. **Swipe to Delete:**
   - Swipe item left → Red delete background appears
   - Release → Confirmation dialog shows
   - Confirm → Item removed, totals recalculate

---

## 🎨 Custom STAC Widgets

This demo includes **5 production-ready custom STAC widgets** that you can use in your own projects:

### 1. StCartBadge
**Location:** `lib/stac_runtime/widgets/cart/st_cart_badge/`

Displays a shopping cart icon with live updating badge count.

**Usage:**
```dart
StCartBadge(
  iconColor: '#2D3436',
  badgeColor: '#FF6B35',
  iconSize: 28,
  onTap: StacNavigator.pushStac('cart'),
)
```

### 2. StCategoryChip
**Location:** `lib/stac_runtime/widgets/cart/st_category_chip/`

Interactive chip for category filtering with selection state.

**Usage:**
```dart
StCategoryChip(category: 'Mains')
```

### 3. StSizeSelector
**Location:** `lib/stac_runtime/widgets/cart/st_size_selector/`

Button group for selecting product size with visual feedback.

**Usage:**
```dart
StSizeSelector(
  stateKey: 'product_123',
  options: [
    {'label': 'Regular', 'price': 0.0},
    {'label': 'Large', 'price': 2.5},
  ],
  initialValue: 'Regular',
)
```

### 4. StAddonSelector
**Location:** `lib/stac_runtime/widgets/cart/st_addon_selector/`

Multi-select checkboxes for product add-ons.

**Usage:**
```dart
StAddonSelector(
  stateKey: 'product_123',
  options: [
    {'label': 'Extra Cheese', 'price': 1.5},
    {'label': 'Bacon', 'price': 2.0},
  ],
  initialSelected: ['Extra Cheese'],
)
```

### 5. StPriceDisplay
**Location:** `lib/stac_runtime/widgets/cart/st_price_display/`

Dynamically calculated price display that updates based on selections.

**Usage:**
```dart
StPriceDisplay(
  stateKey: 'product_123',
  basePrice: 12.99,
  sizePrices: {'Large': 2.5},
  addonPrices: {'Extra Cheese': 1.5, 'Bacon': 2.0},
)
```

---

## 🔧 Creating Custom STAC Widgets

Follow this pattern to create your own stateful STAC widgets:

### Step 1: Create the Model
```dart
@JsonSerializable()
class StMyWidget extends StacWidget {
  final String myProperty;
  
  const StMyWidget({required this.myProperty});
  
  @override
  String get type => 'my_widget';
  
  factory StMyWidget.fromJson(Map<String, dynamic> json) =>
      _$StMyWidgetFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$StMyWidgetToJson(this);
}
```

### Step 2: Create the Parser
```dart
class StMyWidgetParser extends StacParser<StMyWidget> {
  const StMyWidgetParser();
  
  @override
  String get type => 'my_widget';
  
  @override
  StMyWidget getModel(Map<String, dynamic> json) =>
      StMyWidget.fromJson(json);
  
  @override
  Widget parse(BuildContext context, StMyWidget model) {
    return _MyWidgetWidget(model: model);
  }
}

class _MyWidgetWidget extends StatelessWidget {
  const _MyWidgetWidget({required this.model});
  
  final StMyWidget model;
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyController>();
    
    return Obx(() => Container(
      child: Text(controller.myValue.value),
    ));
  }
}
```

### Step 3: Register the Parser
```dart
// lib/stac_runtime/stac_registry.dart
static final List<StacParser> parsers = [
  // ... other parsers
  const StMyWidgetParser(),
];
```

### Step 4: Run Code Generation
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📊 Demo Statistics

| Metric | Count |
|--------|-------|
| Custom STAC Widgets | 5 |
| Custom STAC Actions | 4 |
| GetX Controllers | 2 |
| STAC Screens | 3 |
| Total Interactive Elements | 15+ |
| Lines of STAC DSL | ~700 |
| Lines of Widget Code | ~500 |

---

## 🎓 Learning Resources

### Documentation in This Repo
- 📘 **COMPLETE_STATEFUL_GUIDE.md** - Complete implementation guide
- 📗 **STAC_STATEFUL_README.md** - Cart widget documentation
- 📙 **STATEFUL_ITEM_DETAIL_README.md** - Item detail widgets guide

### External Resources
- 🔗 [Smoketrees App Template](https://github.com/smoke-trees/smoketrees_app_template)
- 🔗 [STAC Documentation](https://github.com/smoke-trees/st_sdui)
- 🔗 [GetX Documentation](https://pub.dev/packages/get)

---

## 🌟 Best Practices Demonstrated

### ✅ Architecture
- Clean separation of concerns (STAC DSL vs Business Logic)
- Centralized state management with GetX
- Type-safe models with code generation
- Reusable widget patterns

### ✅ UI/UX
- Consistent design system (colors, spacing, typography)
- Smooth animations and transitions
- Immediate visual feedback on interactions
- Accessible touch targets (44x44 minimum)

### ✅ Code Quality
- Comprehensive documentation
- Descriptive variable names
- Proper error handling
- Consistent code formatting

### ✅ State Management
- Minimal boilerplate with GetX
- Reactive UI updates with Obx()
- Scoped controllers for better performance
- Proper lifecycle management

---

## 🐛 Troubleshooting

### Issue: Widgets appear static (not interactive)

**Solution:**
1. Ensure STAC screens are compiled:
   ```bash
   cd stac && stac build
   ```

2. Ensure parsers are registered in `stac_registry.dart`

3. Do a full restart (not hot reload):
   ```bash
   # In flutter run terminal
   R  # Capital R for full restart
   ```

### Issue: Price doesn't update

**Solution:**
- Verify all 3 widgets use the **same** `stateKey`
- Check that `ItemSelectionController` is properly initialized
- Ensure `Obx()` is wrapping the reactive parts

### Issue: Build errors after adding custom widget

**Solution:**
```bash
# Clean and regenerate code
flutter clean
dart run build_runner build --delete-conflicting-outputs
cd stac && stac build
```

---

## 🤝 Contributing

This is a demo application for the Smoketrees template. Contributions are welcome!

### How to Contribute
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 🙏 Acknowledgments

- **Smoketrees Team** - For the amazing app template
- **Flutter Community** - For the excellent framework
- **GetX Team** - For the powerful state management solution

---

## 📞 Support

- 📧 **Issues:** [GitHub Issues](https://github.com/RJ2607/menu_cart/issues)
- 💬 **Discussions:** [GitHub Discussions](https://github.com/RJ2607/menu_cart/discussions)
- 🐦 **Twitter:** [@smoketrees](https://twitter.com/smoketrees)

---

<div align="center">

**Built with ❤️ using the Smoketrees App Template**

[⭐ Star this repo](https://github.com/RJ2607/menu_cart) | [🍴 Fork it](https://github.com/RJ2607/menu_cart/fork) | [📖 Read the docs](https://github.com/smoke-trees/smoketrees_app_template)

</div>
