import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getX/customer_information_getX_controller.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {

  CustomerInformationGetXController controller =
  Get.put(
    CustomerInformationGetXController(),
  );


  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'images/auth/img1.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Spacer(),
                SizedBox(height: 60),
                Image.asset(
                  'images/auth/img2.png',
                  width: MediaQuery.of(context).size.width > 350 ? 120 : 70,
                  // width: double.infinity,

                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  child: Image.asset('images/auth/img3.png'),
                ),
                buildElevatedButton(
                    nextScreen: '/sign_up',
                    title: 'Sign Up',
                    bgColor: Colors.deepOrangeAccent),
                const SizedBox(height: 23),
                buildElevatedButton(
                    nextScreen: '/sign_in',
                    title: 'Sign In',
                    bgColor: Colors.white,
                    tColor: Colors.deepOrangeAccent),
                const SizedBox(height: 23),
                buildElevatedButton(
                    nextScreen: '/sign_in_business',
                    title: 'Sign In Business',
                    bgColor: Colors.white,
                    tColor: Colors.deepOrangeAccent),
                const SizedBox(height: 23),
                buildElevatedButton(
                  nextScreen: '/main_screen',
                  title: 'Visitor',
                  bgColor: Colors.white.withOpacity(0.6),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton(
      {required String nextScreen,
      required String title,
      required Color bgColor,
      Color tColor = Colors.white}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, nextScreen);
      },
      child: Text(
        title,
        style: TextStyle(color: tColor),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(258, 50),
          primary: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
