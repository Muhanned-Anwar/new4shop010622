import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {

  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controllerQR;

  late TextEditingController _userNameTextEditingController;
  late TextEditingController _emailTextEditingController;

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if(Platform.isAndroid){
  //     controllerQR!.pauseCamera();
  //   }else if(Platform.isIOS){
  //     controllerQR!.resumeCamera();
  //   }
  // }

  // void _onQRViewCreated(QRViewController controller){
  //   controllerQR = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }
  @override
  void initState() {
    super.initState();
    _userNameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // controllerQR!.disose();

    _userNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ADD CARD',
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
        width: double.infinity,
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 51, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your card details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: _userNameTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailTextEditingController,
                cursorColor: Colors.deepOrangeAccent,
                decoration: const InputDecoration(
                  labelText: 'Name on card',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _emailTextEditingController,
                      cursorColor: Colors.deepOrangeAccent,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'MM',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 21),
                  Expanded(
                    child: TextField(
                      controller: _emailTextEditingController,
                      cursorColor: Colors.deepOrangeAccent,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'YY',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45),
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
                },
                child: const Text('Add'),
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(258, 50),
                  maximumSize: const Size(258, 50),
                ),
                onPressed: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.camera_alt),
                    Text('  Scan Your Card'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


