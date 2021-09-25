import 'package:ecommerce/model/cart_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  List<CartModel> _cartProduct = [];
  List<CartModel> get cartProduct => _cartProduct;

  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    super.onInit();
    
  }

  getCartProduct() async {
    _cartProduct = await LocalDatabase
  }
}
