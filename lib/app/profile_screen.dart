import 'package:flutter/material.dart';
import 'package:new4shop010622/network/api/controllers/customer_api_controller.dart';
import 'package:new4shop010622/utils/helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers{

  double? _progressValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'PROFILE',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit_profile_screen');
            },
            icon: Image.asset('images/app/edit-button.png'),
          ),
          IconButton(
            onPressed: () async => await logout(),
            icon: Image.asset('images/app/logout.png'),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      body: Stack(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.transparent,
                color: Colors.grey.shade200,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20, bottom: 31),
                child: Image.asset(
                  'images/app/drawer/profile.png',
                  height: 114,
                  width: 114,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 27),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 15, color: Colors.deepOrangeAccent),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mohammed Herez',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 52,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 15, color: Colors.deepOrangeAccent),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'mohammedherez@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 52,
                    ),
                    const Text(
                      'Mobile Number',
                      style: TextStyle(
                          fontSize: 15, color: Colors.deepOrangeAccent),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '+1 986-786-421',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15, color: Colors.deepOrangeAccent),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade800,
                              maximumSize: const Size(70, 25),
                              minimumSize: const Size(70, 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/change_password_screen');
                            },
                            child: const Text(
                              'Change',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 52,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> logout()async{
    _changeProgressValue(value: null);
    bool status = await CustomerApiController().logout();
    _changeProgressValue(value: status ? 1 : 0);
    if(status){
      Navigator.pushNamedAndRemoveUntil(context, '/authentication_screen', (route) => false);
      showSnackBar(context: context, message: 'Logout Successfully',time: 2);
    }else{
      showSnackBar(context: context, message: 'Logout Failed, try again',error: true);
    }
  }

  void _changeProgressValue({required double? value}){
    setState(() {
      _progressValue = value;
    });
  }

}
