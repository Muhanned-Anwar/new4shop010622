
import 'package:get/get.dart';

class PickImageController extends GetxController {
  String? _imagePath;

  @override
  void onInit() {
    super.onInit();

  }

  void addImage({required String imagePath}) {
    _imagePath = imagePath;
    update();
  }

  String get image => _imagePath!;
}