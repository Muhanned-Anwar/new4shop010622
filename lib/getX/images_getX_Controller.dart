import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new4shop010622/models/customer_image.dart';

class ImagesGetXController extends GetxController {
  RxList<CustomerImage> images = <CustomerImage>[].obs;

  late RxString _currentImage;

  static ImagesGetXController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _currentImage = ''.obs;
  }

  String get currentImage => _currentImage.value;

  void addCurrentImage({required String imagePath}){
    _currentImage.value = imagePath;
  }

  Future<void> read() async {}

  Future<bool> delete({required BuildContext context, required int id}) async {
    return true;
  }

  Future<void> uploadImage({
    required String filePath,
  }) async {}


}
