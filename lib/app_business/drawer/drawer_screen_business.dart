import 'package:flutter/material.dart';

class DrawerScreenBusiness extends StatelessWidget {
  const DrawerScreenBusiness({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/app/drawer/bg_drawer.png',
          filterQuality: FilterQuality.low,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        Container(
          color: Colors.deepOrangeAccent.withOpacity(0.95),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 65),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 47),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const [
                          SizedBox(height: 10),
                          Text(
                            'WELCOME,',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ' MACROS',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      margin: const EdgeInsets.only(left: 47),
                      child: const Text(
                        'Marcos@gmail.com',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Column(
                children: [
                  // Home
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main_screen_business');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/home.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Home',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Notification
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications_screen_business');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/notification.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Notifications',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Orders
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders_screen_business');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/my_order.png',
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            const Text(
                              'Orders',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              width: 17,
                              height: 17,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                              alignment: Alignment.center,
                              child: const Text('1',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Payment
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/payment_screen_business');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/payment.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Payment',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Support
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/support_screen');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/support.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Support',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // About
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/about_screen');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/about.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'About',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
