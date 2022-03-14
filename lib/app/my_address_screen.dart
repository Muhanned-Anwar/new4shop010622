import 'package:flutter/material.dart';

import '../models/address.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  _MyAddressScreenState createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  List<Address> addresses = [
    Address(
      firstName: 'Mohannad',
      lastName: 'Anwar',
      city: 'Cedar City',
      address: '341 North Street',
      addressMap: 'UT 84720, USA',
      mobileNumber: '0569465030',
      isDefault: true,
    ),
    Address(
        firstName: 'Mohannad',
        lastName: 'Anwar',
        city: 'Cedar City',
        address: '341 North Street',
        addressMap: 'UT 84720, USA',
        mobileNumber: '0569465030',
        isDefault: false),
    Address(
        firstName: 'Mohannad',
        lastName: 'Anwar',
        city: 'Cedar City',
        address: '341 North Street',
        addressMap: 'UT 84720, USA',
        mobileNumber: '0569465030',
        isDefault: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'MY ADDRESS',
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: 335,
                    height: 64,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            addresses[index].isDefault
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: Colors.deepOrangeAccent,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(addresses[index].address),
                            Row(
                              children: [
                                Text(addresses[index].city),
                                const Text(', '),
                                Text(addresses[index].addressMap),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 40),
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pushNamed(context, '/new_address_screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_circle_outline),
                    Text(' Add New Address')
                  ],
                )),
          )
        ],
      ),
    );
  }
}
