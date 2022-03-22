import 'package:flutter/material.dart';
import 'package:new4shop010622/Widgets/code_text_field.dart';
import 'package:new4shop010622/utils/helpers.dart';

import '../getX/customer_information_getX_controller.dart';
import '../network/api/controllers/customer_api_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with Helpers {
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordConfirmationTextController;

  String? _code;
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String? _passwordError;
  String? _confirmPasswordError;

  String _phoneNumber = '+1919 345 8756';
  String _activeNumber = '';
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

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
    _activeNumber = CustomerInformationGetXController.to.getActiveCode();
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
            Container(
              width: 318,
              height: 91,
              margin: const EdgeInsets.only(left: 5),
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
            // Password ----------------------------------------------------
            const SizedBox(height: 20),
            TextField(
              controller: _passwordTextController,
              cursorColor: Colors.deepOrangeAccent,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscurePassword = !_isObscurePassword;
                    });
                  },
                  icon: Icon(
                    _isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrangeAccent),
                ),
                errorText: _passwordError,
                errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordConfirmationTextController,
              cursorColor: Colors.deepOrangeAccent,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isObscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscureConfirmPassword = !_isObscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _isObscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrangeAccent),
                ),
                errorText: _confirmPasswordError,
                errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async => await performResetPassword(),
              child: const Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  minimumSize: const Size(0, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performResetPassword() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (checkFieldError()) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Enter required data!', error: true);
    return false;
  }

  bool checkFieldError() {
    bool code = checkCode();
    bool password = checkPassword();
    bool confirmPassword = checkConfirmPassword();

    setState(() {
      _passwordError = !password ? 'Enter password !' : null;
      _confirmPasswordError =
          !confirmPassword ? 'Enter confirm password !' : null;
    });
    if (code && password && confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      _code = _firstCodeTextController.text +
          _secondCodeTextController.text +
          _thirdCodeTextController.text +
          _fourthCodeTextController.text;
      return true;
    }
    // showSnackBar(context: context, message: 'Enter sent code !', error: true, time: 1);
    return false;
  }

  bool checkPassword() {
    if (_passwordTextController.text.isNotEmpty) {
      if (_passwordTextController.text.length >= 4) {
        if (_passwordTextController.text ==
            _passwordConfirmationTextController.text) {
          return true;
        } else {
          return false;
        }
      } else {
        showSnackBar(
            context: context,
            message: 'Enter correct password!',
            error: true,
            time: 1);
        return false;
      }
    } else {
      return false;
    }
  }


  bool checkConfirmPassword() {
    if (_passwordConfirmationTextController.text.isNotEmpty) {
      if (_passwordConfirmationTextController.text.length >= 4) {
        if (_passwordConfirmationTextController.text ==
            _passwordTextController.text) {
          return true;
        } else {
          showSnackBar(
              context: context,
              message: 'Two password are not equaled!',
              error: true,
              time: 1);
          return false;
        }
      } else {
        showSnackBar(
            context: context,
            message: 'Enter correct password!',
            error: true,
            time: 1);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> resetPassword() async {
    String mobile = _phoneNumber.startsWith('0')
        ? _phoneNumber.substring(1, _phoneNumber.length)
        : _phoneNumber;

    String code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
    bool status = await CustomerApiController().resetPassword(
      mobile: mobile,
      code: code,
      password: _passwordTextController.text,
      passwordConfirmation: _passwordConfirmationTextController.text,
      context: context,
    );
    if (status) {
      Navigator.pushReplacementNamed(context, '/sign_in');
    }
  }
}
