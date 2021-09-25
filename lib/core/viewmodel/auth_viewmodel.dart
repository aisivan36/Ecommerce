import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  String? email, password, name;

  Rxn<User> _user = Rxn<User>();
}
