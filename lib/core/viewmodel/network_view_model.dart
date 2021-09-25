import 'dart:async';

import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class NetworkViewModel extends GetxController {
  var connectionStatus = 0.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubcription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubcription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  _updateConnectionStatus(ConnectivityResult result) async {
    try {
      result = await Connectivity().checkConnectivity();
    } catch (error) {
      print(error);
    }
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubcription.cancel();
  }
}
