class CheckoutModel {
  late String street, city, state, country, phone, totalPrice, date;

  CheckoutModel({
    required this.city,
    required this.street,
    required this.country,
    required this.date,
    required this.phone,
    required this.state,
    required this.totalPrice,
  });

  CheckoutModel.fromJson(Map<dynamic, dynamic> map) {
    street = map['street'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    phone = map['phone'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}
