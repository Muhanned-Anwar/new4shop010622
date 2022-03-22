import 'package:get/get.dart';

class CustomerInformationGetXController extends GetxController {
  late RxString _activeCode;
  late RxString _phoneNumber;

  static CustomerInformationGetXController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _activeCode = ''.obs;
    _phoneNumber = ''.obs;
  }

  String getPhoneNumber() {
    return _phoneNumber.value;
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value.obs;
  }

  String getActiveCode(){
    return _activeCode.value;
  }

  void setActiveCode(String value){
    _activeCode.value = value;
  }

}
