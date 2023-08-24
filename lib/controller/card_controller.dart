import 'package:get/get.dart';

import '../model/product_model.dart';

class CartController extends GetxController {
  final RxList<Product> cart = <Product>[].obs;
  RxDouble totalAmount = 0.0.obs; //..

  void addToCart(Product product) {
    final existingProduct = cart.firstWhere((p) => p.id == product.id,
        orElse: () => Product(
              id: 0,
              name: "",
              price: 0,
              img: "",
            ));

    if (existingProduct.id == 0) {
      cart.add(product);
    } else {
      existingProduct.quantity++;
    }
    updateTotalAmount();
  }

  void removeFromCart(int productId) {
    cart.removeWhere((p) => p.id == productId);
    updateTotalAmount();
    update();
  }

  void inc(Product product) {
    product.quantity++;
    updateTotalAmount();
    update();
  }

  void dec(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
      updateTotalAmount();
      update();
    }
  }

  void clearCart() {
    cart.clear();
    update();
  }

  void updateTotalAmount() {
    // Recalculate the total amount
    double newTotal =
        cart.fold(0, (sum, product) => sum + product.price * product.quantity);
    totalAmount.value = newTotal;
  }
}
