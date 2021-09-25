import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/checkout_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreCheckout {
  final CollectionReference _orderCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders');

  Future<List<QueryDocumentSnapshot>> getOrderFromFirestore() async {
    var _orders =
        await _orderCollection.orderBy('date', descending: true).get();
    return _orders.docs;
  }

  addOrderToFirestore(CheckoutModel checkoutModel) async {
    await _orderCollection.doc().set(checkoutModel.toJson());
  }
}
