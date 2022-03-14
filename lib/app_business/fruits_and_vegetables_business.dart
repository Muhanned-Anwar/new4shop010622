import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new4shop010622/app/search/search_operator.dart';
import 'package:new4shop010622/getX/images_getX_Controller.dart';
import 'package:new4shop010622/getX/pick_image_controller.dart';
import 'package:new4shop010622/models/category.dart';

class FruitsAndVegetablesBusiness extends StatefulWidget {
  const FruitsAndVegetablesBusiness({Key? key}) : super(key: key);

  @override
  _FruitsAndVegetablesBusinessState createState() =>
      _FruitsAndVegetablesBusinessState();
}

class _FruitsAndVegetablesBusinessState
    extends State<FruitsAndVegetablesBusiness> {
  late int index;

  List<Category> data = [
    Category(
        id: 0,
        name: 'Fresh Fruits',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits.png'),
    Category(
        id: 1,
        name: 'Fresh Herbs',
        imagePath: 'images/app/FruitsAndVegetables/fresh_herbs.png'),
    Category(
        id: 2,
        name: 'Fresh Vegetables',
        imagePath: 'images/app/FruitsAndVegetables/fresh_vegetables.png'),
  ];

  RangeValues _currentRangeValues = const RangeValues(0, 30);

  late ImagePicker _imagePicker;
  XFile? _pickedFile;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = const RangeValues(0, 30);
  }

  bool _showFiltered = false;
  bool _showCancelFiltered = false;
  bool isFilter = false;


  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);
    if (modalRoute != null && modalRoute.settings.arguments != null) {
      Map<String, dynamic> map =
          modalRoute.settings.arguments as Map<String, dynamic>;
      index = map.containsKey('index') ? map['index'] : 'NO VALUE';
    }
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
          'FRUITS & VEGETABLES',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              context: context,
              builder: (context) {
                return buildBottomSheet(context);
              });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(bottom: 20, top: 70, right: 20, left: 20),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fresh_fruits_business');
                    },
                    child: Container(
                      width: 335,
                      height: 100,
                      margin: const EdgeInsets.only(left: 10),
                      child: Stack(
                        children: [
                          Image.asset(data[index].imagePath),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.4),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              data[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Using with top sheet button
          Visibility(
            visible: _showCancelFiltered,
            // visible: _showFiltered,
            child: Container(
              margin: const EdgeInsets.only(top: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, padding: EdgeInsets.zero),
                onPressed: () {
                  setState(() {
                    isFilter = false;
                    _showFiltered = false;
                    _showCancelFiltered = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),

          // Search Box && Filter Items
          Column(
            children: [
              buildSearchOperator(),

              // Filter Items
              Visibility(
                visible: isFilter,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  firstCurve: Curves.easeInToLinear,
                  crossFadeState: _showFiltered
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade200,
                        ),
                        width: double.infinity,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 15, bottom: 41),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'By Category',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          primary: Colors.deepOrangeAccent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      onPressed: () {},
                                      child: const Text(
                                        'All',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 5,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          primary: Colors.deepOrangeAccent
                                              .withOpacity(0.2),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      onPressed: () {},
                                      child: const Text(
                                        'Fresh Fruits',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.deepOrangeAccent),
                                      ),
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 7,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          primary: Colors.deepOrangeAccent
                                              .withOpacity(0.2),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      onPressed: () {},
                                      child: const Text(
                                        'Fresh Vegetables',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.deepOrangeAccent),
                                      ),
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 5,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          primary: Colors.deepOrangeAccent
                                              .withOpacity(0.2),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      onPressed: () {},
                                      child: const Text(
                                        'Fresh Herbs',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.deepOrangeAccent),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28),
                              const Divider(color: Colors.grey),
                              const SizedBox(height: 28),
                              const Text(
                                'By Price',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              RangeSlider(
                                values: _currentRangeValues,
                                max: 100,
                                activeColor: Colors.deepOrangeAccent,
                                inactiveColor: Colors.grey.shade300,
                                // divisions: 5,
                                labels: RangeLabels(
                                  _currentRangeValues.start.round().toString(),
                                  _currentRangeValues.end.round().toString(),
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                  });
                                },
                              ),
                              Row(
                                children: const [
                                  SizedBox(width: 10),
                                  Text(
                                    '\$0',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  SizedBox(width: 85),
                                  Text(
                                    '\$200',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  left: 60,
                                  right: 60,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(258, 50),
                                      primary: Colors.deepOrangeAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: () {},
                                  child: const Text(
                                    'save',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  secondChild: Container(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildBottomSheet(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 419,
      padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Text(
                'NEW CATEGORY',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 33),
              GetBuilder<PickImageController>(
                init: PickImageController(),
                builder: (controller) {
                  return Container(
                    width: 273,
                    height: 135,
                    child: _pickedFile != null
                        ? Image.file(File(controller.image),)
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
                            onPressed: () async => await pickImage(controller),
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  const SizedBox(height: 46),
                                  Image.asset('images/app_admin/landscape.png'),
                                  const SizedBox(height: 13),
                                  const Text(
                                    'CATEGORY COVER',
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
                decoration: InputDecoration(
                  hintText: 'Category Name',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 45),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade800,
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
            ],
          ),
        ],
      ),
    );
  }

  Align buildSearchOperator() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        width: 335,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade100,
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            prefixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isFilter = true;
                  Future.delayed(
                    const Duration(milliseconds: 100),
                    () {
                      setState(() {
                        _showFiltered = true;
                        Future.delayed(
                          const Duration(milliseconds: 150),
                          () {
                            setState(() {
                              _showCancelFiltered = true;
                            });
                          },
                        );
                      });
                    },
                  );
                });
              },
              icon: Visibility(
                  visible: true,
                  child: Image.asset('images/app/path16610.png')),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
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
