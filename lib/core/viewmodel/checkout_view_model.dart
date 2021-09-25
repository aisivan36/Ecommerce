import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/services/firestore_checkout.dart';
import 'package:ecommerce/model/checkout_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutViewModel extends GetxController {
  String? street, city, state, country, phone;

  List<CheckoutModel> _checkouts = [];

  List<CheckoutModel> get checkouts => _checkouts;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    _getCheckoutsFromFireStore();
  }

  _getCheckoutsFromFireStore() async {
    _isLoading = true;
    _checkouts = [];

    List<QueryDocumentSnapshot> _checkoutsSnapshot =
        await FirestoreCheckout().getOrderFromFirestore();
    for (var order in _checkoutsSnapshot) {
      _checkouts
          .add(CheckoutModel.fromJson(order.data() as Map<String, dynamic>));
    }
    _isLoading = false;
    update();
  }

  addCheckoutToFireStore() async {
    await FirestoreCheckout().addOrderToFirestore(CheckoutModel(
      city: city!,
      street: street!,
      country: country!,
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
      phone: phone!,
      state: state!,
      totalPrice: Get.find<CartViewModel>(),
    ));
  }
}
