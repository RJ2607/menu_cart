# 🎬 Demo Presentation Script

Use this script to present the Urban Bites demo app effectively.

---

## 🎯 Introduction (30 seconds)

> "Hi, I'm presenting Urban Bites - a fully functional food ordering app built with the Smoketrees App Template. This demo showcases production-ready features including stateful STAC screens, GetX state management, and complete cart functionality."

**Show:** App running on device/emulator, menu screen visible

---

## 📱 Menu Screen (1 minute)

### **Cart Badge**
> "First, notice the live cart badge. It shows real-time item counts and updates automatically."

**Action:** Point to cart icon with badge showing "3"

### **Category Filtering**
> "The category chips are fully interactive. Watch what happens when I tap 'Mains'..."

**Action:** 
1. Tap "Mains" chip
2. Show chip highlights (blue background)
3. Show only main dishes displayed

> "The list filters instantly. I can switch to Drinks..."

**Action:** Tap "Drinks" chip, show drinks only

> "Or back to All..."

**Action:** Tap "All", show all items return

### **Product Cards**
> "Each product card is tappable. Let's view the Classic Urban Burger."

**Action:** Tap burger card, navigate to detail screen

---

## 🍔 Item Detail Screen (2 minutes)

### **Dynamic Price**
> "Notice the price starts at $12.99. Now watch what happens when I select options."

### **Size Selection**
> "I'll select the Large size..."

**Action:** Tap "Large" button

> "The button highlights immediately, AND the price updates to $15.49. That's the base price plus the $2.50 size modifier."

**Show:** Price changed, button highlighted

### **Addon Selection**
> "Now let's add some extras. I'll select Bacon..."

**Action:** Tap "Bacon" checkbox

> "The checkbox toggles on, the border highlights, and the price increases by $2.00 to $17.49."

**Action:** Tap "Avocado"

> "Adding Avocado brings it to $19.99. These are real-time calculations, not hardcoded values."

**Show:** Final price: $19.99

### **Multiple Selection**
> "Notice Extra Cheese was already selected. I can toggle it off..."

**Action:** Tap "Extra Cheese" to uncheck

> "And the price decreases by $1.50 to $18.49."

**Show:** Price updated again

### **Price Calculation Recap**
> "So the calculation is: Base $12.99 + Large $2.50 + Bacon $2.00 + Avocado $2.50 = $19.99. Every selection updates instantly."

### **Add to Cart**
> "The 'Add to Cart' button shows the calculated price. Let's add it..."

**Action:** Tap "Add to Cart" button

> "We get a success message and navigate directly to the cart."

**Show:** Snackbar message, cart screen appears

---

## 🛒 Cart Screen (1.5 minutes)

### **Cart Items**
> "Here's our cart. You can see the burger with all the options we selected: Large, Bacon, Avocado."

**Show:** Item details with size and addons listed

### **Quantity Controls**
> "I can adjust quantities with the + and - buttons..."

**Action:** 
1. Tap + button → Show quantity increase to 2
2. Show price doubles
3. Tap - button → Show quantity back to 1

> "The prices update immediately. If I decrease to zero, the item removes."

### **Swipe to Delete**
> "Or I can swipe to delete..."

**Action:** Partially swipe an item left to show red background

> "See the red delete indicator? Completing the swipe removes the item."

**Action:** Complete swipe OR cancel by swiping back

### **Order Summary**
> "The cart calculates everything: subtotal from all items, plus a $5 delivery fee, for the total."

**Show:** Point to subtotal, delivery fee, and total

### **Place Order**
> "Let's place the order..."

**Action:** Tap "Place Order" button

**Wait:** 1 second (simulated API call)

> "The order processes, and we get a success dialog with the order number."

**Show:** Success dialog with order ID and total

**Action:** Tap "Back to Menu"

> "The cart clears and we're back at the menu, ready for another order."

**Show:** Empty cart, menu screen

---

## 🏗️ Technical Highlights (1 minute)

### **Architecture**
> "From a technical standpoint, this demonstrates several production patterns:"

**Say quickly:**
- "GetX for reactive state management"
- "Persistent cart storage"
- "Smart item merging when you add the same product with same options"
- "Clean MVC architecture"
- "Real-world data models"

### **STAC Integration**
> "What's really impressive is that the STAC screens - which are defined in JSON - are fully stateful and interactive, not just static mockups."

### **Code Quality**
> "The code follows all best practices: proper error handling, loading states, empty states, and comprehensive documentation."

---

## 🎯 Key Features Recap (30 seconds)

> "To summarize, this demo includes:"

**List quickly:**
- ✅ Live cart badge that updates automatically
- ✅ Interactive category filtering
- ✅ Dynamic size and addon selection
- ✅ Real-time price calculations
- ✅ Full cart management with quantity controls
- ✅ Swipe to delete
- ✅ Order placement
- ✅ Persistent storage
- ✅ Complete error handling

---

## 💡 Use Cases (30 seconds)

> "This template is perfect for:"
- Food delivery apps
- E-commerce stores
- Service booking apps
- Any app requiring shopping cart functionality

> "Everything you've seen is production-ready code that you can use as a foundation for your own app."

---

## 🙋 Questions Setup

> "The complete source code, documentation, and setup instructions are available on GitHub. I'm happy to answer any questions about the implementation, architecture, or specific features."

---

## 📝 Presentation Tips

### Preparation
- [ ] App running and ready
- [ ] Start on menu screen
- [ ] Cart should have 2-3 items pre-seeded for quick demo
- [ ] Practice flow 2-3 times beforehand
- [ ] Have backup device/recording ready

### During Presentation
- **Pace:** Slow enough to show features, fast enough to maintain interest
- **Highlight:** The state changes - "Watch what happens when..."
- **Numbers:** Mention specific prices to show real calculations
- **Interaction:** Actually tap, don't just narrate
- **Recovery:** If something doesn't work, acknowledge and move on

### What to Emphasize
1. **Real functionality** - Not just pretty UI
2. **State management** - Everything updates automatically
3. **Production quality** - Error handling, edge cases
4. **Template showcase** - Demonstrates Smoketrees patterns

### Common Questions & Answers

**Q: Is the cart persistent?**
A: Yes, it uses GetStorage to persist across app restarts.

**Q: Can you add different size/addon combinations of the same product?**
A: Yes, they're tracked as separate items. But adding the exact same combination increments the quantity.

**Q: How does the price calculation work?**
A: Base price + size modifier + sum of all addon prices, multiplied by quantity.

**Q: Is this using real API calls?**
A: The order placement simulates an API call with a 1-second delay. The architecture supports easy integration with a real backend.

**Q: Can I use this for my own project?**
A: Yes! It's built on the Smoketrees template and designed to be a starting point.

---

## 🎥 Video Recording Tips

### Setup
- Clean background
- Good lighting
- Clear audio
- Screen recording software ready

### Recording Flow
1. **Intro (5 sec):** Show app icon/splash
2. **Menu (15 sec):** Show category filtering
3. **Detail (30 sec):** Show size/addon selection with price changes
4. **Cart (30 sec):** Show quantity controls and order placement
5. **Success (10 sec):** Show order confirmation
6. **Outro (10 sec):** Show menu again, fade out

Total: ~90 seconds for short demo
Extended: 3-5 minutes with narration

### Editing
- Add captions for key features
- Highlight UI changes with arrows/circles
- Add upbeat background music (low volume)
- Include text overlay: "Built with Smoketrees App Template"

---

## 📱 Live Demo Checklist

Before presenting:
- [ ] App built and running
- [ ] Device charged/plugged in
- [ ] Notifications disabled
- [ ] Demo mode enabled (if available)
- [ ] Cart pre-seeded with 2-3 items
- [ ] Internet connection stable (for images)
- [ ] Backup plan ready (video recording)

During demo:
- [ ] Speak clearly and at moderate pace
- [ ] Pause briefly after each action
- [ ] Make eye contact with audience
- [ ] Point to screen when referencing features
- [ ] Smile and be enthusiastic!

---

**You've got this! Your demo is production-quality and will impress!** 🚀
