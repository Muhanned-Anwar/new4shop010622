import 'package:flutter/material.dart';
import 'package:new4shop010622/models/prefix_number.dart';
import 'package:new4shop010622/utils/helpers.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with Helpers {
  int preFixId = 1;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  final List<PreFixNumber> _preFixes = [
    PreFixNumber(1, Image.asset('images/auth/US.png'), '+1'),
    PreFixNumber(2, Image.asset('images/auth/US.png'), '+2'),
  ];

  late TextEditingController _usernameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;

  String? _usernameError;
  String? _emailError;
  String? _phoneNumberError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _emailTextController.dispose();
    _phoneNumberTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.black, fontSize: 36),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _usernameTextController,
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
                    errorText: _usernameError,
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
                  controller: _emailTextController,
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
                    errorText: _emailError,
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
                  controller: _phoneNumberTextController,
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
                    errorText: _phoneNumberError,
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
                  controller: _passwordTextController,
                  cursorColor: Colors.deepOrangeAccent,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontSize: 20,
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
                  controller: _confirmPasswordTextController,
                  cursorColor: Colors.deepOrangeAccent,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscureConfirmPassword =
                              !_isObscureConfirmPassword;
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
                Row(
                  children: [
                    const Text('Already have account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },
                      child: const Text('Log In'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async => performSignUp(),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performSignUp() async {
    if (checkData()) {
      await signUp();
    }
  }

  bool checkData() {
    if (checkFieldError()) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Enter required data', error: true, time: 1);
    return false;
  }

  bool checkFieldError() {
    bool username = checkUsername();
    bool email = checkEmail();
    bool phoneNumber = checkPhoneNumber();
    bool password = checkPassword();
    bool confirmPassword = checkConfirmPassword();

    setState(() {
      _usernameError = !username ? 'Enter username !' : null;
      _emailError = !email ? 'Enter email !' : null;
      _phoneNumberError = !phoneNumber ? 'Enter phone number !' : null;
      _passwordError = !password ? 'Enter password !' : null;
      _confirmPasswordError =
          !confirmPassword ? 'Enter confirm password !' : null;
    });
    if (username && email && phoneNumber && password && confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  bool checkUsername() {
    if (_usernameTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool checkEmail() {
    if (_emailTextController.text.isNotEmpty) {
      if (_emailTextController.text.contains('@')) {
        return true;
      } else {
        showSnackBar(
            context: context,
            message: 'Enter correct email!',
            error: true,
            time: 1);
        return false;
      }
    } else {
      return false;
    }
  }

  bool checkPhoneNumber() {
    if (_phoneNumberTextController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  bool checkPassword() {
    if (_passwordTextController.text.isNotEmpty) {
      if (_passwordTextController.text.length >= 8) {
        return true;
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
    if (_confirmPasswordTextController.text.isNotEmpty) {
      if (_confirmPasswordTextController.text.length >= 8) {
        if (_confirmPasswordTextController.text ==
            _passwordTextController.text) {
          return true;
        } else {
          showSnackBar(
              context: context,
              message: 'Tow password are not equaled!',
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

  Future<void> signUp() async {
    Navigator.pushReplacementNamed(context, '/confirm_phone_number');
  }
}
