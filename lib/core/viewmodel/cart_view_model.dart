import 'package:ecommerce/core/services/local_database_cart.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  List<CartModel> _cartProduct = [];
  List<CartModel> get cartProduct => _cartProduct;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    super.onInit();
  }

  getCartProduct() async {
    _cartProduct = await LocalDatabaseCart.db.getAllProducts();
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    _totalPrice = 0;
    for (var cartProduct in _cartProduct) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    }
  }
}
