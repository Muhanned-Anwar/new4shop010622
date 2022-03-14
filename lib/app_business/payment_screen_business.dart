import 'package:flutter/material.dart';

class PaymentScreenBusiness extends StatefulWidget {
  const PaymentScreenBusiness({Key? key}) : super(key: key);

  @override
  _PaymentScreenBusinessState createState() => _PaymentScreenBusinessState();
}

class _PaymentScreenBusinessState extends State<PaymentScreenBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'PAYMENT',
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
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add New Payment Method',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 88,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('images/app/master_card.png')),
                      const SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '**** **** **** 8765',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            'Mohammed Herez',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(width: 33),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(60, 24),
                            primary: Colors.grey.shade200,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: const Text(
                          'CVV',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_card_screen');
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    const Text('Add New Card',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)
                  ],
                ),

              ],
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(258, 50),
                  maximumSize: const Size(258, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/main_screen_admin');
                },
                child: const Text('ADD MONEY'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
