# Stateful Item Detail Screen - Implementation Guide

## Overview

The item detail screen now has **full state management** for size selection, addon selection, and dynamic price calculation using custom STAC widgets.

## New Stateful Widgets

### 1. **StSizeSelector**

Interactive size selector with visual feedback.

**STAC JSON:**
```json
{
  "type": "size_selector",
  "stateKey": "item_detail_state",
  "options": [
    {"label": "Regular", "price": 0.0},
    {"label": "Large", "price": 2.5}
  ],
  "initialValue": "Regular"
}
```

**Features:**
- ✅ Click to select size
- ✅ Visual highlight when selected
- ✅ Border color changes
- ✅ Background color changes
- ✅ State persists within screen

### 2. **StAddonSelector**

Interactive addon selector with checkboxes.

**STAC JSON:**
```json
{
  "type": "addon_selector",
  "stateKey": "item_detail_state",
  "options": [
    {"label": "Extra Cheese", "price": 1.5},
    {"label": "Bacon", "price": 2.0},
    {"label": "Avocado", "price": 2.5}
  ],
  "initialSelected": ["Extra Cheese"]
}
```

**Features:**
- ✅ Click to toggle addon
- ✅ Checkbox icon changes
- ✅ Border highlights when selected
- ✅ Multiple selection support
- ✅ State persists within screen

### 3. **StPriceDisplay**

Dynamic price calculator that updates based on selections.

**STAC JSON:**
```json
{
  "type": "price_display",
  "stateKey": "item_detail_state",
  "basePrice": 12.99,
  "sizePrices": {
    "Regular": 0.0,
    "Large": 2.5
  },
  "addonPrices": {
    "Extra Cheese": 1.5,
    "Bacon": 2.0,
    "Avocado": 2.5
  }
}
```

**Features:**
- ✅ Automatically recalculates price
- ✅ Updates when size changes
- ✅ Updates when addons change
- ✅ Shows formatted price ($XX.XX)

## How It Works

### State Management Architecture

```
ItemSelectionController (GetX)
  ↓
  ├─ selectedSize: RxString ('Regular' or 'Large')
  ├─ selectedAddons: RxList<String> (['Extra Cheese', ...])
  └─ stateKey: String (unique identifier)
       ↓
  All 3 widgets share the same controller via stateKey
       ↓
  When any widget updates state, all widgets react
```

### Flow Diagram

```
User clicks "Large" button
  ↓
StSizeSelector.onTap()
  ↓
controller.selectSize('Large')
  ↓
selectedSize.value = 'Large' (RxString updates)
  ↓
Obx() in all widgets triggers rebuild
  ↓
├─ StSizeSelector shows "Large" as selected
└─ StPriceDisplay recalculates: $12.99 + $2.50 = $15.49
```

## Usage in STAC DSL

### Step 1: Import the widgets
```dart
import 'package:menu_cart/stac_runtime/widgets/cart/st_size_selector/st_size_selector.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_addon_selector/st_addon_selector.dart';
import 'package:menu_cart/stac_runtime/widgets/cart/st_price_display/st_price_display.dart';
```

### Step 2: Use in your STAC screen
```dart
@StacScreen(screenName: 'my_screen')
StacWidget myScreen() {
  const stateKey = 'my_unique_key';
  
  return StacScaffold(
    body: StacColumn(
      children: [
        // Price display
        StPriceDisplay(
          stateKey: stateKey,
          basePrice: 10.0,
          sizePrices: {'Small': 0.0, 'Large': 2.0},
          addonPrices: {'Extra': 1.5},
        ),
        
        // Size selector
        StSizeSelector(
          stateKey: stateKey,
          options: [
            {'label': 'Small', 'price': 0.0},
            {'label': 'Large', 'price': 2.0},
          ],
        ),
        
        // Addon selector
        StAddonSelector(
          stateKey: stateKey,
          options: [
            {'label': 'Extra', 'price': 1.5},
          ],
        ),
      ],
    ),
  );
}
```

### Step 3: Compile STAC
```bash
cd stac
stac build
```

## Key Concepts

### 1. State Key
- **Purpose**: Links all widgets to the same controller
- **Requirement**: Must be unique per screen/item
- **Example**: `'item_detail_state'`, `'product_123'`, etc.

### 2. Controller Lifecycle
- Created when first widget is parsed
- Tagged with `stateKey` for retrieval
- Shared across all widgets with same `stateKey`
- Auto-disposed when screen is disposed

### 3. Reactive Updates
- All widgets use `Obx(() => ...)` for reactivity
- State changes trigger automatic UI updates
- No manual setState() or rebuild calls needed

## Files Created

```
lib/
├── features/cart/
│   └── item_selection_controller.dart       # GetX controller
├── stac_runtime/
│   └── widgets/cart/
│       ├── st_size_selector/
│       │   ├── st_size_selector.dart        # Model
│       │   ├── st_size_selector.g.dart      # Generated
│       │   └── st_size_selector_parser.dart # Parser + Widget
│       ├── st_addon_selector/
│       │   ├── st_addon_selector.dart
│       │   ├── st_addon_selector.g.dart
│       │   └── st_addon_selector_parser.dart
│       └── st_price_display/
│           ├── st_price_display.dart
│           ├── st_price_display.g.dart
│           └── st_price_display_parser.dart
└── stac/lib/cart_demo/
    └── item_detail_screen_stateful.dart     # Updated STAC screen
```

## Testing

1. **Build STAC:**
   ```bash
   cd stac
   stac build
   ```

2. **Navigate to screen:**
   - Screen name: `item_detail_stateful`

3. **Test interactions:**
   - ✅ Click "Regular" → Price stays same
   - ✅ Click "Large" → Price increases by $2.50
   - ✅ Click "Extra Cheese" → Price increases by $1.50
   - ✅ Click "Bacon" → Price increases by $2.00
   - ✅ Click addon again → Price decreases (addon removed)
   - ✅ All changes reflect instantly

## Comparison: Static vs Stateful

| Feature | Static (old) | Stateful (new) |
|---------|-------------|----------------|
| Size selection | Visual only | Fully interactive |
| Addon selection | Visual only | Fully interactive |
| Price | Fixed | Dynamic calculation |
| Button state | Hardcoded | Real-time updates |
| User feedback | None | Immediate visual changes |

## Extending This Pattern

To create similar stateful widgets:

1. **Create a controller** (if state is complex)
2. **Create the model** (extends `StacWidget`)
3. **Create the parser** (extends `StacParser`)
4. **Use `Obx`** for reactive parts
5. **Register in `stac_registry.dart`**

## Benefits

✅ **True Interactivity** - Buttons respond to clicks  
✅ **State Management** - GetX handles all state  
✅ **Type Safe** - Code-generated models  
✅ **Reusable** - Works in any STAC screen  
✅ **Token Efficient** - Compact JSON  
✅ **Developer Friendly** - Easy to understand  

This implementation follows the **smoketrees template pattern** exactly and provides a production-ready solution for stateful STAC screens.
