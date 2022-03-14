import 'package:flutter/material.dart';

import '../models/item.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({Key? key}) : super(key: key);

  @override
  _OrderReviewScreenState createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  late List<Item> _accessories;
  late List<Item> mobiles;

  @override
  void initState() {
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
        price: 340,
      ),
      Item(
          id: 1,
          title: 'I Phone X',
          imagePath: 'images/app/cart/IphoneX.png',
          price: 290,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ORDER REVIEW',
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
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body:  ListView(
        children: [
          Container(
            height: 510,
            margin: const EdgeInsets.all(20),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
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
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Items : 1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),                                        ],
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
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Items : 1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),                                        ],
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
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Items : 1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),                                    ],
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
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Items : 1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),                                       ],
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
            height: 240,
            width: 375,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 35,right: 30,top: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'SUBTOTAL ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$5.35',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 35,right: 30,top: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'DISCOUNT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 35,right: 30,top: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'TAX(%12)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '6.00',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
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
                          '\$5.35',
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
                      maximumSize: const Size(258,50),
                      minimumSize: const Size(258,50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Colors.transparent,
                    elevation: 0,
                    side: const BorderSide(
                      color: Colors.black
                    )
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/view_invoice_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('images/app/cart/invoice.png',filterQuality: FilterQuality.high,),
                      const Text('  View Invoice',style: TextStyle(fontSize: 15,color: Colors.black),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
