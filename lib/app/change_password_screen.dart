import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _oldPasswordTextEditingController;
  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController _confirmNewPasswordTextEditingController;

  @override
  void initState() {
    super.initState();
    _oldPasswordTextEditingController = TextEditingController();
    _newPasswordTextEditingController = TextEditingController();
    _confirmNewPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordTextEditingController.dispose();
    _newPasswordTextEditingController.dispose();
    _confirmNewPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'CHANGE PASSWORD',
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
                  const SizedBox(height: 50),
                  TextField(
                    controller: _oldPasswordTextEditingController,
                    cursorColor: Colors.deepOrangeAccent,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Old Password',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _newPasswordTextEditingController,
                    cursorColor: Colors.deepOrangeAccent,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _confirmNewPasswordTextEditingController,
                    cursorColor: Colors.deepOrangeAccent,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Confirm New Password',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(258, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/confirm_phone_number');
                    },
                    child: const Text('Save'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/forgot_password_screen');
                      },
                      child: const Text(
                        'forgot password!',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
