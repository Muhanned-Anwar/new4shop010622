import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/prefix_number.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<PreFixNumber> _preFixes = [
    PreFixNumber(1, Image.asset('images/auth/US.png'), '+1'),
    PreFixNumber(2, Image.asset('images/auth/US.png'), '+2'),
  ];

  int preFixId = 1;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  late TextEditingController _userNameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _mobileNumberTextEditingController;

  @override
  void initState() {
    super.initState();
    _userNameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _mobileNumberTextEditingController = TextEditingController();
    _userNameTextEditingController.text = 'Mohammed Herez';
    _emailTextEditingController.text = 'mohammedherez@gmail.com';
    _mobileNumberTextEditingController.text = '986-786-421';
  }

  @override
  void dispose() {
    _userNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _mobileNumberTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'EDIT PROFILE',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_screen');
            },
            icon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 50),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.asset(
                      'images/app/drawer/profile.png',
                      height: 114,
                      width: 114,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      height: 114,
                      width: 114,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 34,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _userNameTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _userNameTextEditingController.text = '';
                      });
                    },
                    icon: const Icon(Icons.dangerous_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _emailTextEditingController.text = '';
                      });
                    },
                    icon: const Icon(Icons.dangerous_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _mobileNumberTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  hintText: 'Ex : 986-786-421',
                  prefixStyle: const TextStyle(
                      color: Colors.black, backgroundColor: Colors.black),
                  prefix: DropdownButton<int>(
                    hint: const Text('PreFix'),
                    style: const TextStyle(color: Colors.black),
                    value: preFixId,
                    onChanged: (int? value) {
                      setState(() {
                        preFixId = value!;
                      });
                    },
                    items: _preFixes.map((PreFixNumber pre) {
                      return DropdownMenuItem<int>(
                          value: pre.id,
                          child: Row(
                            children: [pre.image, Text(pre.preFix)],
                          ));
                    }).toList(),
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _mobileNumberTextEditingController.text = '';
                      });
                    },
                    icon: const Icon(Icons.dangerous_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 60),
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
            ],
          ),
        ),
      ),
    );
  }
}
