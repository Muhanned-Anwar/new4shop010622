import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _oldPasswordTextEditingController;

  @override
  void initState() {
    super.initState();
    _oldPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordTextEditingController.dispose();
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
                    controller: _oldPasswordTextEditingController,
                    cursorColor: Colors.deepOrangeAccent,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Write Your Email',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/confirm_phone_number');
                    },
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
}
