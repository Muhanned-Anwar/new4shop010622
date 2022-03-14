import 'package:flutter/material.dart';
import 'package:new4shop010622/models/item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Item> _accessories;
  late List<Item> mobiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accessories = [
      Item(
        id: 0,
        title: 'Spray',
        imagePath: 'images/app/cart/spray.png',
      ),
      Item(
          id: 1,
          title: 'Perfume',
          imagePath: 'images/app/cart/perfume.png',
          price: 10.35),
    ];

    mobiles = [
      Item(
        id: 0,
        title: 'I Phone 11',
        imagePath: 'images/app/cart/Iphone11.png',
      ),
      Item(
          id: 1,
          title: 'Perfume',
          imagePath: 'images/app/cart/IphoneX.png',
          price: 10.35),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'CART',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 510,
            margin: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 13, bottom: 16, left: 16, right: 28),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Accessories',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '\$10.35',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  _accessories[0].imagePath,
                                  filterQuality: FilterQuality.high,
                                  width: 58,
                                  height: 58,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _accessories[0].title,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        width: 120,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: Colors.black26,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              ' ' +
                                                  _accessories[0]
                                                      .number
                                                      .toString() +
                                                  ' ',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                'images/app/details/plus.png',
                                                width: 16,
                                                height: 16,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$' + _accessories[0].price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  _accessories[1].imagePath,
                                  filterQuality: FilterQuality.high,
                                  width: 58,
                                  height: 58,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _accessories[1].title,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        width: 120,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: Colors.black26,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              ' ' +
                                                  _accessories[1]
                                                      .number
                                                      .toString() +
                                                  ' ',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                'images/app/details/plus.png',
                                                width: 16,
                                                height: 16,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$' + _accessories[1].price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 13, bottom: 16, left: 16, right: 28),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Accessories',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '\$10.35',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  mobiles[0].imagePath,
                                  filterQuality: FilterQuality.high,
                                  width: 58,
                                  height: 58,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mobiles[0].title,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        width: 120,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: Colors.black26,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              ' ' +
                                                  mobiles[0].number.toString() +
                                                  ' ',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                'images/app/details/plus.png',
                                                width: 16,
                                                height: 16,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$' + mobiles[0].price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  mobiles[1].imagePath,
                                  filterQuality: FilterQuality.high,
                                  width: 58,
                                  height: 58,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mobiles[1].title,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        width: 120,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: Colors.black26,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              ' ' +
                                                  mobiles[1].number.toString() +
                                                  ' ',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                'images/app/details/plus.png',
                                                width: 16,
                                                height: 16,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$' + mobiles[1].price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            width: 375,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'TOTAL',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$256',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(258,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.black54
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/check_out');
                  },
                  child: const Text('Check Out'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
