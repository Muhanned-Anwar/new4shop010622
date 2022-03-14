import 'package:flutter/material.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  _NewAddressScreenState createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _firstNameTextEditingController;
  late TextEditingController _lastNameTextEditingController;
  late TextEditingController _cityTextEditingController;
  late TextEditingController _addressTextEditingController;
  late TextEditingController _addressMapTextEditingController;
  late TextEditingController _mobileNumberTextEditingController;

  double hintSize = 15;
  @override
  void initState() {
    super.initState();
    _firstNameTextEditingController = TextEditingController();
    _lastNameTextEditingController = TextEditingController();
    _cityTextEditingController = TextEditingController();
    _addressTextEditingController = TextEditingController();
    _addressMapTextEditingController = TextEditingController();
    _mobileNumberTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _addressTextEditingController.dispose();
    _addressMapTextEditingController.dispose();
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
          'NEW ADDRESS',
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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: ListView(
            children: [
              TextField(
                controller: _firstNameTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    fontSize: hintSize,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _lastNameTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    fontSize: hintSize,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _cityTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                      fontSize: hintSize,
                      color: Colors.grey.shade400,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.deepOrangeAccent,
                    ),),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _addressTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    fontSize: hintSize,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _addressMapTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'Choose address from map',
                  labelStyle: TextStyle(
                    fontSize: hintSize,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.deepOrangeAccent,
                    ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _mobileNumberTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(
                    fontSize: hintSize  ,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: const [
                  Icon(
                    Icons.check_box_outlined,
                    color: Colors.deepOrangeAccent,
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Set as default',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    minimumSize: const Size(258, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pushNamed(context, '/new_address_screen');
                },
                child: const Text(
                  ' Add',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
