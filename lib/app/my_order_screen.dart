import 'package:flutter/material.dart';
import 'package:new4shop010622/models/order.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  bool isLinearProgress = true;
  bool _isCurrentLinearProgress = true;
  bool _isFinishedLinearProgress = false;
  late double _currentProgressValue = 1;
  late double _finishedProgressValue = 0;
  late double _currentMinHeightProgressValue = 2;
  late double _finishedMinHeightProgressValue = 1;

  List<Order> currentOrders = [
    Order(
        id: '#99658',
        title: 'Waiting',
        titleColor: Colors.blue,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
    Order(
        id: '#99658',
        title: 'Ongoing',
        titleColor: Colors.deepOrangeAccent,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
    Order(
        id: '#99658',
        title: 'Rejected',
        titleColor: Colors.red.shade800,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
  ];

  List<Order> finishOrders = [
    Order(
        id: '#99658',
        title: 'Delivered',
        titleColor: Colors.green,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
    Order(
        id: '#99658',
        title: 'Rejected',
        titleColor: Colors.red.shade800,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
    Order(
        id: '#99658',
        title: 'Canceled',
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
    Order(
        id: '#99658',
        title: 'Rejected',
        titleColor: Colors.red.shade800,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
    Order(
        id: '#99658',
        title: 'Rejected',
        titleColor: Colors.red.shade800,
        dateTime: '15 NOV 2019, 05:35 pm',
        price: '\$155'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'MY ORDER',
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
      body: currentOrders.isEmpty && finishOrders.isEmpty
          ? Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Image.asset('images/app/cart/artwork.png'),
                  const Spacer(
                    flex: 2,
                  ),
                  const Text(
                    'YOUR CART IS EMPTY',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    width: 300,
                    height: 77,
                    alignment: Alignment.topCenter,
                    child: const Text(
                      '''Looks like you haven’t made
            your order yet.''',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(258, 50),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Back to Categories',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.arrow_forward,size: 20,)
                        ],
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              minimumSize: const Size(70, 25),
                            ),
                            onPressed: () {
                              setState(() {
                                _finishedProgressValue = 0;
                                _currentProgressValue = 1;
                                _finishedMinHeightProgressValue = 1;
                                _currentMinHeightProgressValue = 2;
                                _isCurrentLinearProgress = true;
                                _isFinishedLinearProgress = false;
                              });
                            },
                            child: Text(
                              'Current',
                              style: TextStyle(
                                color: _currentProgressValue == 1
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isCurrentLinearProgress,
                            child: SizedBox(
                              width: 80,
                              child: LinearProgressIndicator(
                                value: _currentProgressValue,
                                color: Colors.deepOrangeAccent,
                                backgroundColor: Colors.transparent,
                                minHeight: _currentMinHeightProgressValue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              minimumSize: const Size(70, 25),
                            ),
                            onPressed: () {
                              setState(() {
                                _finishedProgressValue = 1;
                                _currentProgressValue = 0;
                                _finishedMinHeightProgressValue = 2;
                                _currentMinHeightProgressValue = 1;
                                _isCurrentLinearProgress = false;
                                _isFinishedLinearProgress = true;
                              });
                            },
                            child: Text(
                              'Finished',
                              style: TextStyle(
                                color: _finishedProgressValue == 1
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isFinishedLinearProgress,
                            child: SizedBox(
                              width: 80,
                              child: LinearProgressIndicator(
                                value: _finishedMinHeightProgressValue,
                                color: Colors.deepOrangeAccent,
                                backgroundColor: Colors.transparent,
                                minHeight: _finishedMinHeightProgressValue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: _isCurrentLinearProgress,
                  child: buildItems(currentOrders),
                  replacement: buildItems(finishOrders),
                ),
              ],
            ),
    );
  }

  Widget buildItems(List<Order> data) {
    if (data.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 620,
        child: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 0,
          mainAxisSpacing: 16,
          childAspectRatio: 4,
          children: data.map((e) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/order_details_screen');
              },
              child: Container(
                width: 335,
                height: 88,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              e.id.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              e.title,
                              style: TextStyle(
                                fontSize: 12,
                                color: e.titleColor,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              '15 NOV 2019, 05:35 pm',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '\$155',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return const SizedBox(
        height: 620,
        child: Center(
          child: Text(
            'There is no item',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }
}
