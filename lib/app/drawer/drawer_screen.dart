import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new4shop010622/getX/drawer_getX.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {


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
        SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 69),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 69),
                          child: const CircleAvatar(
                            minRadius: 35,
                            backgroundImage: AssetImage(
                              'images/app/drawer/profile.png',
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 0, left: 50),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'WELCOME,',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'MOHAMMED HEREZ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // Spacer(flex: 1,),
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
                      Navigator.pushReplacementNamed(context, '/main_screen');
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
                      Navigator.pushNamed(context, '/notifications_screen');
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

                  // Profile
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile_screen');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/person.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Profile',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // My Orders
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/my_order_screen');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/my_order.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'My Orders',
                          style: TextStyle(fontSize: 16),
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
                      Navigator.pushNamed(context, '/payment_screen');
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

                  // My Wishlist
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SizedBox(width: 45),
                        Image.asset(
                          'images/app/drawer/my_wishlist.png',
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'My Wishlist',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // My Address
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/my_address_screen');
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 47),
                        Image.asset(
                          'images/app/drawer/location.png',
                        ),
                        const SizedBox(width: 25),
                        const Text(
                          'My Address',
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
              ),
              const SizedBox(height: 50),
              // Spacer(flex: 3,),
            ],
          ),
        )
      ],
    );
  }
}
