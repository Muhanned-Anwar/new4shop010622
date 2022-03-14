import 'package:get/get.dart';

class DrawerGetX extends GetxController {
  late RxDouble _homePageBorderRadius;

  static DrawerGetX get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _homePageBorderRadius = 0.0.obs;
  }

  double get homePageBorderRadius => _homePageBorderRadius.value;


  void changeHomePageBorderRadius(double value) {
    _homePageBorderRadius.value = value;
  }
}
