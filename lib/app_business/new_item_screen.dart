import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';

import '../getX/pick_image_controller.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({Key? key}) : super(key: key);

  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  bool _checkStatus = false;

  late ImagePicker _imagePicker;
  XFile? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 34,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'NEW ITEM',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 37),
                GetBuilder<PickImageController>(
                  init: PickImageController(),
                  builder: (controller) {
                    return Container(
                      width: 273,
                      height: 135,
                      child: _pickedFile != null
                          ? Image.file(
                              File(controller.image),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(273, 135),
                                maximumSize: const Size(273, 135),
                                primary: Colors.grey.shade200,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () async =>
                                  await pickImage(controller),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 46),
                                    Image.asset(
                                        'images/app_admin/landscape.png'),
                                    const SizedBox(height: 13),
                                    const Text(
                                      'ITEM PHOTO',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                const TextField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const TextField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    labelText: 'Price - \$',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Checkbox(
                      value: _checkStatus,
                      onChanged: (value) {
                        setState(() {
                          _checkStatus = value!;
                        });
                      },
                      side: const BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                      activeColor: Colors.deepOrangeAccent,
                    ),
                    Text(
                      'Discount',
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade700),
                    )
                  ],
                ),
                const TextField(
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 66),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(258, 50),
                      maximumSize: const Size(258, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/main_screen_admin');
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage(PickImageController controller) async {
    _imagePicker = ImagePicker();
    XFile? selectedImageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImageFile != null) {
      setState(() {
        _pickedFile = selectedImageFile;
      });
      controller.addImage(imagePath: _pickedFile!.path);
    }
  }
}
