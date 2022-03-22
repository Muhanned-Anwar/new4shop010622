import 'package:flutter/material.dart';

import '../getX/customer_information_getX_controller.dart';
import '../network/api/controllers/customer_api_controller.dart';
import '../utils/helpers.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> with Helpers{
  late TextEditingController _mobileTextEditingController;
  String? _mobileError;

  @override
  void initState() {
    super.initState();
    _mobileTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileTextEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'FORGOT PASSWORD',
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
            )),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 51),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'images/app/new4Shop.png',
                  ),
                  const SizedBox(height: 70),
                  TextField(
                    controller: _mobileTextEditingController,
                    cursorColor: Colors.deepOrangeAccent,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Write Your Phone Number',
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      ),
                      errorText: _mobileError,
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade300,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(258, 50),
                      maximumSize: const Size(258, 50),
                    ),
                    onPressed: () async => performForgetPassword(),
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (checkFieldError()) {
      return true;
    } else {

      return false;
    }
  }

  bool checkFieldError() {
    bool mobile = checkMobile();

    setState(() {
      _mobileError = !mobile ? 'Enter mobile number !' : null;
    });
    if (mobile) {
      return true;
    } else {
      return false;
    }
  }

  bool checkMobile() {
    if (_mobileTextEditingController.text.isNotEmpty) {
      if (_mobileTextEditingController.text.length >= 7) {
        return true;
      } else {
        showSnackBar(
            context: context,
            message: 'Enter correct mobile by Length >= 7!',
            error: true,
            time: 1);
        return false;
      }
    } else {
      showSnackBar(
          context: context,
          message: 'Enter required data!',
          error: true,
          time: 1);
      return false;
    }
  }


  Future<void> forgetPassword() async {
    String mobile = _mobileTextEditingController.text.startsWith('0')
        ? _mobileTextEditingController.text.substring(
        1, _mobileTextEditingController.text.length)
        : _mobileTextEditingController.text;

    bool status = await CustomerApiController().forgetPassword(
      mobile: mobile,
      context: context,
    );
    if (status) {
      CustomerInformationGetXController.to.setPhoneNumber(_mobileTextEditingController.text);
      Navigator.pushNamed(context, '/reset_password_screen');
    }
  }
}
