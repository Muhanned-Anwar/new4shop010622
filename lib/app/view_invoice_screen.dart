import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewInvoiceScreen extends StatefulWidget {
  const ViewInvoiceScreen({Key? key}) : super(key: key);

  @override
  _ViewInvoiceScreenState createState() => _ViewInvoiceScreenState();
}

class _ViewInvoiceScreenState extends State<ViewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'VIEW INVOICE',
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
            icon: const Icon(
              Icons.local_print_shop_outlined,
              color: Colors.deepOrangeAccent,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20,),
        child: ListView(
          children: [
            Container(
              height: 141,
              width: 335,
              padding: const EdgeInsets.only(left: 16,right: 27,top: 13,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Order ID : #99658',style: TextStyle(color: Colors.grey),),
                  const Divider(color: Colors.grey, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('ORDERED AT:'),
                      Text('9:30AM, 15 NOV 2018')
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('DELIVERED AT:'),
                      Text('11:30AM, 15 NOV 2018')
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('DURATION:'),
                      Text('1h:30m')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            Container(
              height: 103,
              width: 335,
              padding: const EdgeInsets.only(left: 16,right: 27,top: 13,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Delivery Address:',style: TextStyle(color: Colors.grey),),
                  const Divider(color: Colors.grey, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('''341 North Street
Cedar City, UT 84720, USA'''),
                      Icon(Icons.location_on_outlined,color: Colors.deepOrangeAccent,)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            Container(
              height: 85,
              width: 335,
              padding: const EdgeInsets.only(left: 16,right: 27,top: 13,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Copon Number :',style: TextStyle(color: Colors.grey),),
                  Divider(color: Colors.grey, height: 16),
                  Text('3365987'),
                ],
              ),
            ),
            const SizedBox(height: 11),
            Container(
              height: 85,
              width: 335,
              padding: const EdgeInsets.only(left: 16,right: 27,top: 13,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Item',style: TextStyle(color: Colors.grey),),
                      Text('Price',style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  const Divider(color: Colors.grey, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Spray'),
                      Text('\$4.25'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            Container(
              height: 160,
              width: 335,
              padding: const EdgeInsets.only(left: 16,right: 27,top: 13,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Price',style: TextStyle(color: Colors.grey),),
                  const Divider(color: Colors.grey, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('SUBTOTAL :'),
                      Text('\$5.35')
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('DISCOUNT. :'),
                      Text('0.00')
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('TAX(%12)'),
                      Text('6.00')
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('TOTAL :'),
                      Text('\$5.35')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
