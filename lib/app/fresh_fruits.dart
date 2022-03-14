import 'package:flutter/material.dart';
import 'package:new4shop010622/app/search/search_operator.dart';

import '../models/item.dart';

class FreshFruits extends StatefulWidget {
  const FreshFruits({Key? key}) : super(key: key);

  @override
  _FreshFruitsState createState() => _FreshFruitsState();
}

class _FreshFruitsState extends State<FreshFruits> {
  List<Item> freshItems = [
    Item(
      id: 0,
      title: 'Item1',
      imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item1.png',
    ),
    Item(
      id: 1,
      title: 'Item2',
      imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item2.png',
      discount: true,
    ),
    Item(
      id: 2,
      title: 'Item3',
      imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item3.png',
      discount: true,
    ),
    Item(
        id: 3,
        title: 'Item4',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item4.png'),
    Item(
        id: 4,
        title: 'Item5',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item5.png'),
    Item(
        id: 5,
        title: 'Item6',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item6.png'),
    Item(
        id: 0,
        title: 'Item1',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item1.png'),
    Item(
        id: 1,
        title: 'Item2',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item2.png'),
    Item(
        id: 2,
        title: 'Item3',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item3.png'),
    Item(
        id: 3,
        title: 'Item4',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item4.png'),
    Item(
        id: 4,
        title: 'Item5',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item5.png'),
    Item(
        id: 5,
        title: 'Item6',
        imagePath: 'images/app/FruitsAndVegetables/fresh_fruits/item6.png'),
  ];

  bool isLinear = false;
  int crossCount = 2;
  double childAspectRatio = 0.8;
  double marginLeftItems = 28;
  double marginTopItems = 100;

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
          'FRESH FRUITS',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          appBarActions(),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: marginTopItems, left: marginLeftItems),
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: crossCount,
              crossAxisSpacing: 0,
              mainAxisSpacing: 16,
              childAspectRatio: childAspectRatio,
              children: freshItems.map((e) {
                return Visibility(
                  visible: !isLinear,
                  replacement: linearItems(e),
                  child: gridItems(e),
                );
              }).toList(),
            ),
          ),
          Column(
            children: [
              SearchOperator(
                width: 335,
                radius: 20,
                isSuffix: false,
              ),
              Visibility(
                maintainSize: false,
                maintainState: false,
                visible: !isLinear,
                child: Container(
                  margin: const EdgeInsets.only(right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'SORT ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Image.asset(
                          'images/app/FruitsAndVegetables/fresh_fruits/compare_arrow.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  Visibility appBarActions() {
    return Visibility(
          visible: !isLinear,
          child: IconButton(
            onPressed: () {
              setState(() {
                isLinear = !isLinear;
                crossCount = 1;
                childAspectRatio = 4;
                marginLeftItems = 0;
                marginTopItems = 75;
              });
            },
            icon: Image.asset(
                'images/app/FruitsAndVegetables/fresh_fruits/linear.png'),
          ),
          replacement: IconButton(
            onPressed: () {
              setState(() {
                isLinear = !isLinear;
                crossCount = 2;
                childAspectRatio = 0.8;
                marginLeftItems = 28;
                marginTopItems = 100;
              });
            },
            icon: Image.asset(
                'images/app/FruitsAndVegetables/fresh_fruits/grid.png'),
          ),
        );
  }

  Container gridItems(Item e) {
    return Container(
      margin: EdgeInsets.zero,
      height: 230,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Image.asset(
                  e.imagePath,
                  fit: BoxFit.fill,
                  width: 156,
                  height: 148,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, right: 35),
                  alignment: Alignment.topRight,
                  child: Visibility(
                    visible: e.discount,
                    child: Container(
                      width: 70,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Discount',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            e.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: e.discount,
                child: Text(
                  '\$7.35' + ' /kg',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(visible: e.discount, child: const SizedBox(width: 10)),
              const Text(
                '\$5.35' + ' /kg',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade800,
                  size: 16,
                ),
                const Text(
                  '(5.0) ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('26 orders'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container linearItems(Item e) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  e.imagePath,
                  fit: BoxFit.fill,
                  width: 74,
                  height: 70,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Visibility(
                    visible: e.discount,
                    child: Row(
                      children: [
                        Visibility(
                          child: Text(
                            '\$5.35' + ' /kg',
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '\$5.35' + ' /kg',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    replacement: const Text(
                      '\$5.35' + ' /kg',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: e.discount,
                    child: SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade800,
                            size: 16,
                          ),
                          const Text(
                            '(5.0) ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            '26 orders',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(width: 40),
          Container(
            alignment: Alignment.center,
            child: Visibility(
              visible: e.discount,
              child: Container(
                width: 70,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Discount',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
