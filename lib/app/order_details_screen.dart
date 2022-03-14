import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ORDER DETAILS',
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit_order_screen');
            },
            icon: Image.asset('images/app/cart/edit_order.png'),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 335,
                      height: 64,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.deepOrangeAccent,
                              size: 26,
                            ),
                          ),
                          const Text('''341 North Street
Cedar City, UT 84720, USA'''),
                          const SizedBox(width: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(60, 24),
                                primary: Colors.grey.shade200,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/my_address_screen');
                            },
                            child: const Text(
                              'Change',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/new_address_screen');
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    const Text(
                      'Add New Address',
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  width: 335,
                  height: 64,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('images/app/cart/voucher.png')),
                      const Text(
                        'Copon Number : 3365987',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 35),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(60, 25),
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: const Text('Add')),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 335,
                      height: 215,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Accessories',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const Text(
                                  '\$10.35',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Divider(color: Colors.grey.shade300),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 14, top: 5),
                                      child: Image.asset(
                                        'images/app/cart/spray.png',
                                        width: 58,
                                        height: 58,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Spray',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Items : 1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text(
                                  '\$5.35',
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 14, top: 5),
                                      child: Image.asset(
                                        'images/app/cart/perfume.png',
                                        width: 58,
                                        height: 58,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Perfume',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Items : 1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text(
                                  '\$10.35',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 27),
                              alignment: Alignment.center,
                              width: 154,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                '9am-1am',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(right: 7),
                              alignment: Alignment.center,
                              width: 154,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                '1pm-5pm',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 21),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 27),
                              alignment: Alignment.center,
                              width: 154,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                '5pm-9pm',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(right: 7),
                              alignment: Alignment.center,
                              width: 154,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                '9pm-12am',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'Notes ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'no later than 12 AM. Thank you',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const Divider(height: 20),
                    const SizedBox(height: 32),
                  ],
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
                    margin: const EdgeInsets.only(left: 35, right: 30, top: 19),
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
                    margin: const EdgeInsets.only(left: 35, right: 30, top: 19),
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
                    margin: const EdgeInsets.only(left: 35, right: 30, top: 19),
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
                    minimumSize: const Size(258, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.deepOrangeAccent)),
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Cancel Order',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 17,
                    ),
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
