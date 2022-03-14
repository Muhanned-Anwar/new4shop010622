import 'package:flutter/material.dart';
import 'package:new4shop010622/utils/helpers.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with Helpers {
  bool _isObscurePassword = true;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
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
            margin: const EdgeInsets.symmetric(horizontal: 51),
            child: Column(
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 25,
                    left: 85,
                    right: 85,
                    bottom: 50,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/launch_screen/launch2.png',
                    width: 85,
                    height: 104,
                  ),
                ),
                const Text(
                  'SIGN IN',
                  style: TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 15),
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
                    // errorBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(
                    //     color: Colors.red.shade300,
                    //     width: 1,
                    //   ),
                    // ),
                  ),

                ),
                const SizedBox(height: 15),
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
                    // errorBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(
                    //     color: Colors.red.shade300,
                    //     width: 1,
                    //   ),
                    // ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1,
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid)),
                          ),
                          const SizedBox(width: 4),
                          const Text('Remember me'),
                        ],
                      ),
                      const SizedBox(width: 40),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_up');
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(258, 50),
                  ),
                  onPressed: () => performLogin(),
                  child: const Text('Login'),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'OR',
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'images/auth/facebook.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'images/auth/google.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'images/auth/twitter.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (checkFieldError()) {
      return true;
    }else{
      showSnackBar(context: context, message: 'Enter required data!',error: true,time: 1);
      return false;
    }
  }

  bool checkFieldError(){
    bool email = checkEmail();
    bool password = checkPassword();
    setState(() {
      _emailError =  !email ? 'Enter email !':null;
      _passwordError = !password ? 'Enter password !':null;
    });
    if(email && password ){
      return true;
    }else{
      return false;
    }
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

  Future<void> login() async {
    Navigator.pushNamed(context, '/main_screen');
  }
}
