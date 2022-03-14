import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new4shop010622/prefs/customer_preference_controller.dart';
import 'package:new4shop010622/prefs/user_prefernce_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        String routeName = CustomerPreferenceController().loggedIn
            ? '/main_screen'
            : UserPreferenceController().firstTime
                ? '/authentication_screen'
                : '/out_boarding_screen';
        Navigator.pushReplacementNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/launch_screen/launch1.png',
            filterQuality: FilterQuality.low,
            height: double.infinity,
          ),
          Image.asset(
            'images/launch_screen/launch3.png',
            filterQuality: FilterQuality.low,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset('images/launch_screen/launch2.png'),
          ),
        ],
      ),
    );
  }
}
