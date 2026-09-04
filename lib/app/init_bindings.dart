import 'package:get/get.dart';
import '../features/cart/controllers/cart_controller.dart';
import '../features/products/controllers/product_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    // Register cart and product controllers
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}
