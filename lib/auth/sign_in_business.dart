import 'package:flutter/material.dart';

class SignInBusiness extends StatefulWidget {
  const SignInBusiness({Key? key}) : super(key: key);

  @override
  _SignInBusinessState createState() => _SignInBusinessState();
}

class _SignInBusinessState extends State<SignInBusiness> {
  bool _isObscurePassword = true;

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
        margin: const EdgeInsets.symmetric(horizontal: 51),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
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
            const TextField(
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent))),
            ),
            const SizedBox(height: 15),
            TextField(
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
              ),
            ),
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
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(258, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/main_screen_business');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
