import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new4shop010622/models/category.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../getX/images_getX_Controller.dart';
import 'drawer/drawer_screen_business.dart';

class MainScreenBusiness extends StatefulWidget {
  const MainScreenBusiness({Key? key}) : super(key: key);

  @override
  _MainScreenBusinessState createState() => _MainScreenBusinessState();
}

class _MainScreenBusinessState extends State<MainScreenBusiness> {
  @override
  Widget build(BuildContext context) {
    return const SlideDrawer(
      child: HomePage(),
      drawer: DrawerScreenBusiness(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [
    Category(
      name: 'Fruits & Vegetables ',
      imagePath: 'images/app_admin/fruits_vegetables.png',
    ),
    Category(
      name: 'Meats ',
      imagePath: 'images/app_admin/meats.png',
    ),
    Category(
      name: 'Clothes ',
      imagePath: 'images/app_admin/clothes.png',
    ),
    Category(
      name: 'Electronic ',
      imagePath: 'images/app_admin/electronics.png',
    ),
  ];

  bool isFilter = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'HOME',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/authentication_screen',(route) => false,);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                SlideDrawer.of(context)?.toggle();
              },
              icon: Image.asset('images/app/drawer.png'),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          // List of items in home screen
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/fruits_and_vegetables_business',
                        arguments: {'index': index});
                  },
                  child: Container(
                    width: 159,
                    height: 145,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categories[index].imagePath,
                          width: 75,
                          height: 70,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: categories.length,
            ),
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
}
