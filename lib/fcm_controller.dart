import 'package:get/get.dart';

class FCMController extends GetxController {
  RxString payloadOnMessage = "".obs;

  set setPayload(String value) {
    payloadOnMessage.value = value;
  }

  clearData() {
    setPayload = "";
  }
}
