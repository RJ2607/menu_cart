import 'package:get/get.dart';
import 'package:menu_cart/core/controllers/cart_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    // Register cart and product controllers
    Get.put<CartController>(CartController(), permanent: true);
    // STAC custom parsers use the original demo controller type. Keep it
    // registered alongside the Flutter feature controller while both routes
    // remain supported.
  }
}
