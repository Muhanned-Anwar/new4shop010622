import 'package:flutter/material.dart';
import 'package:new4shop010622/models/category.dart';
import 'package:new4shop010622/models/item.dart';
import 'package:slide_drawer/slide_drawer.dart';

import 'drawer/drawer_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const SlideDrawer(
      child: HomePage(),
      drawer: DrawerScreen(),
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
        imagePath: 'images/app/fruits_vegetables.png'),
    Category(name: 'Meats ', imagePath: 'images/app/meats.png'),
    Category(name: 'Clothes ', imagePath: 'images/app/clothes.png'),
    Category(name: 'Electronic ', imagePath: 'images/app/electronics.png'),
  ];

  List<Item> bestItems = [
    Item(id: 1, title: 'Potato', imagePath: 'images/app/potato.png'),
    Item(id: 1, title: 'Spray', imagePath: 'images/app/spray.png'),
    Item(id: 2, title: 'Cocooil', imagePath: 'images/app/cocooil.png'),
    Item(id: 3, title: 'Shoes ', imagePath: 'images/app/shoes.png'),
  ];

  List<Item> featuresItems = [
    Item(id: 0, title: 'Catchup', imagePath: 'images/app/catchup.png'),
    Item(id: 1, title: 'Eggs', imagePath: 'images/app/eggs.png'),
    Item(id: 2, title: 'Eggs', imagePath: 'images/app/eggs.png'),
  ];

  RangeValues _currentRangeValues = const RangeValues(0, 30);

  late MediaQueryData queryData;

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
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'HOME',
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('images/app/code_scanning.png'),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_screen');
            },
            icon: Image.asset('images/app/shopping_cart.png'),
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
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.grey.shade200,
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // List of items in home screen
          RefreshIndicator(
            color: Colors.deepOrangeAccent,
            backgroundColor: Colors.grey.shade200,
            onRefresh: () async {},
            child: Container(
              margin: const EdgeInsets.only(top: 77),
              child: ListView(
                children: [
                  // Main Category ( Fruits & Vegetables, Meats, Clothes and Electronic )
                  Container(
                    height: 120,
                    margin: const EdgeInsets.only(right: 15),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.05,
                      ),
                      itemBuilder: (context, index) {
                        return MainCategory(context, index);
                      },
                      itemCount: categories.length,
                    ),
                  ),

                  // Best Items In GridView
                  Container(
                    margin: const EdgeInsets.only(top: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 24, right: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Best Items',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0,
                                    side: const BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    minimumSize: const Size(80.5, 25.21)),
                                onPressed: () {
                                  print(queryData.size.width.toString());
                                },
                                child: const Text(
                                  'Show More',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          alignment: Alignment.center,
                          height: 481,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            childAspectRatio:
                                queryData.size.width > 350 ? 0.8 : 0.7,
                            children: bestItems.map((e) {
                              return InkWell(
                                onTap: () {
                                  if (e.id == 0) {
                                    Navigator.pushNamed(
                                        context, '/item_details_vegetables');
                                  } else {
                                    Navigator.pushNamed(
                                        context, '/item_details');
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        e.imagePath,
                                        width: double.infinity,
                                        height: 148,
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high,
                                      ),
                                      const Spacer(flex: 1),
                                      Container(
                                        // margin: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          e.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // const SizedBox(height: 4),
                                      const Spacer(flex: 1),
                                      const Text(
                                        '\$5.35' + ' /kg',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      // const SizedBox(height: 4),
                                      const Spacer(flex: 1),
                                      Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow.shade700,
                                              size: 16,
                                            ),
                                            const Text('(5.0)'),
                                            const Text('26 orders'),
                                          ],
                                        ),
                                      ),
                                      const Spacer(flex: 3),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Features Items In GridView
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Features',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.zero,
                              primary: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: const Size(80.5, 25.21)),
                          onPressed: () {},
                          child: const Text(
                            'Show More',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 20),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.35,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                featuresItems[index].imagePath,
                                fit: BoxFit.cover,
                                width: 133,
                                height: 126,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                featuresItems[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text(
                                '\$5.35' + ' /kg',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text('(5.0)'),
                                  Text('26 orders'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: featuresItems.length,
                    ),
                  ),

                  // Popular Items In GridView
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.zero,
                              primary: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: const Size(80.5, 25.21)),
                          onPressed: () {},
                          child: const Text(
                            'Show More',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 20),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.35,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                featuresItems[index].imagePath,
                                fit: BoxFit.cover,
                                width: 133,
                                height: 126,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                featuresItems[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text(
                                '\$5.35' + ' /kg',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text('(5.0)'),
                                  Text('26 orders'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: featuresItems.length,
                    ),
                  ),
                ],
              ),
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

  // ignore: non_constant_identifier_names
  Container MainCategory(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/fruits_and_vegetables',
              arguments: {'index': index});
        },
        child: Container(
          width: 107,
          height: 98,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                categories[index].imagePath,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              Text(
                categories[index].name,
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
            ],
          ),
        ),
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
}

/*

      body: Container(
        // padding: EdgeInsets.only(top: 70),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          // borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ]
        ),
        child: Stack(
          children: [
            // List of items in home screen
            Container(
              margin: const EdgeInsets.only(top: 77),
              child: ListView(
                children: [
                  // Main Category ( Fruits & Vegetables, Meats, Clothes and Electronic )
                  Container(
                    height: 120,
                    margin: const EdgeInsets.only(right: 15),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.05,
                      ),
                      itemBuilder: (context, index) {
                        return MainCategory(context, index);
                      },
                      itemCount: categories.length,
                    ),
                  ),

                  // Best Items In GridView
                  Container(
                    margin: const EdgeInsets.only(top: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 24, right: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Best Items',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0,
                                    side: const BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    minimumSize: const Size(80.5, 25.21)),
                                onPressed: () {},
                                child: const Text(
                                  'Show More',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          alignment: Alignment.center,
                          height: 481,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            childAspectRatio: 0.8,
                            children: bestItems.map((e) {
                              return InkWell(
                                onTap: () {
                                  if (e.id == 0) {
                                    Navigator.pushNamed(
                                        context, '/item_details_vegetables');
                                  } else {
                                    Navigator.pushNamed(
                                        context, '/item_details');
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        e.imagePath,
                                        width: 158,
                                        height: 148,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          e.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        '\$5.35' + ' /kg',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow.shade700,
                                              size: 16,
                                            ),
                                            const Text('(5.0)'),
                                            const Text('26 orders'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Features Items In GridView
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Features',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.zero,
                              primary: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: const Size(80.5, 25.21)),
                          onPressed: () {},
                          child: const Text(
                            'Show More',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 20),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.35,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                featuresItems[index].imagePath,
                                fit: BoxFit.cover,
                                width: 133,
                                height: 126,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                featuresItems[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text(
                                '\$5.35' + ' /kg',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text('(5.0)'),
                                  Text('26 orders'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: featuresItems.length,
                    ),
                  ),

                  // Popular Items In GridView
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.zero,
                              primary: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: const Size(80.5, 25.21)),
                          onPressed: () {},
                          child: const Text(
                            'Show More',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 20),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.35,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                featuresItems[index].imagePath,
                                fit: BoxFit.cover,
                                width: 133,
                                height: 126,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                featuresItems[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text(
                                '\$5.35' + ' /kg',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text('(5.0)'),
                                  Text('26 orders'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: featuresItems.length,
                    ),
                  ),
                ],
              ),
            ),

            // Using with top sheet button
            Visibility(
              visible: isFilter,
              child: Container(
                margin: const EdgeInsets.only(top: 160),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, padding: EdgeInsets.zero),
                  onPressed: () {
                    setState(() {
                      isFilter = false;
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
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  buildSearchOperator(),

                  // Filter Items
                  Visibility(
                    visible: isFilter,
                    child: Container(
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
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                                SizedBox(width: 85),
                                Text(
                                  '\$200',
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 60),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(258, 50),
                                    primary: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15))),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),

 */
