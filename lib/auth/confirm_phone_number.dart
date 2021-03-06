import 'package:flutter/material.dart';
import 'package:new4shop010622/Widgets/code_text_field.dart';
import 'package:new4shop010622/utils/helpers.dart';

import '../getX/customer_information_getX_controller.dart';
import '../network/api/controllers/customer_api_controller.dart';

class ConfirmPhoneNumber extends StatefulWidget {
  const ConfirmPhoneNumber({Key? key}) : super(key: key);

  @override
  _ConfirmPhoneNumberState createState() => _ConfirmPhoneNumberState();
}

class _ConfirmPhoneNumberState extends State<ConfirmPhoneNumber> with Helpers {
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordConfirmationTextController;

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

   String _phoneNumber = '+1919 345 8756';
  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _passwordConfirmationTextController = TextEditingController();

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();

    _phoneNumber = CustomerInformationGetXController.to.getPhoneNumber();

  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _passwordConfirmationTextController.dispose();

    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  double? _progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(top: 20, left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 34,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            LinearProgressIndicator(
              value: _progressValue,
              color: Colors.deepOrangeAccent,
              backgroundColor: Colors.transparent,
              minHeight: 4,
            ),
            Container(
              width: 318,
              height: 91,
              margin: const EdgeInsets.only(left: 5,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the 4-digit code sent to you at $_phoneNumber'
                    '. did you enter the correct number?',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CodeTextField(
                    codeTextController: _firstCodeTextController,
                    focusNode: _firstFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) _secondFocusNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CodeTextField(
                    codeTextController: _secondCodeTextController,
                    focusNode: _secondFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _thirdFocusNode.requestFocus();
                      } else {
                        _firstFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CodeTextField(
                    codeTextController: _thirdCodeTextController,
                    focusNode: _thirdFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _fourthFocusNode.requestFocus();
                      } else {
                        _secondFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CodeTextField(
                    codeTextController: _fourthCodeTextController,
                    focusNode: _fourthFocusNode,
                    onChanged: (value) {
                      if (value.isEmpty) _thirdFocusNode.requestFocus();
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(40),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Resend SMS in ', style: TextStyle(color: Colors.grey)),
                  Text(
                    '27',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('I didn???t receive code',
                      style: TextStyle(color: Colors.black)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.deepOrangeAccent, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () async => await performActivate(),
                      icon: const Icon(
                        Icons.arrow_forward_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeProgressValue({required double? value}) {
    setState(() {
      _progressValue = value;
    });
  }

  Future<void> performActivate() async {
    if(checkData()){
      await confirmPhone();
    }
  }

  bool checkData() {
    if (checkCode()) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Enter required data!', error: true);
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Enter sent code !', error: true, time: 1);
    return false;
  }

  Future<void> confirmPhone() async{
    _changeProgressValue(value: null);
    String mobile = _phoneNumber.startsWith('0')
        ? _phoneNumber
        .substring(1, _phoneNumber.length)
        : _phoneNumber;
    String code = _firstCodeTextController.text + _secondCodeTextController.text + _thirdCodeTextController.text + _fourthCodeTextController.text;
    bool status = await CustomerApiController().activate(mobile: mobile, code: code, context: context);
    _changeProgressValue(value: status ? 1 : 0);
    if(status){
      Navigator.pushReplacementNamed(context, '/sign_in');
    }
  }
}
