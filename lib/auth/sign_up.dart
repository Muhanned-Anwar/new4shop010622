import 'package:flutter/material.dart';
import 'package:new4shop010622/getX/customer_information_getX_controller.dart';
import 'package:new4shop010622/network/api/controllers/city_api_controller.dart';
import 'package:new4shop010622/network/api/controllers/customer_api_controller.dart';
import 'package:new4shop010622/utils/helpers.dart';

import '../models/city/city.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with Helpers {
  int preFixId = 1;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  String? selectedGender;
  int? _selectedCity;



  late TextEditingController _usernameTextController;

  // late TextEditingController _emailTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;

  String? _usernameError;

  // String? _emailError;
  String? _phoneNumberError;
  String? _passwordError;
  String? _confirmPasswordError;
  List<City> cities = [];
  late Future<List<City>> _futureCities;
  List<DropdownMenuItem> citiesItem = [];

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    _futureCities = CityApiController().getUsers();
    _usernameTextController.text = 'mohanned';
    _mobileTextController.text = '0569465030';
    _passwordTextController.text = '0569465030';
    _confirmPasswordTextController.text = '0569465030';
    selectedGender = 'M';
    _selectedCity = 1;
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    // _emailTextController.dispose();
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
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
      body: ListView(
        children: [
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: _progressValue,
            color: Colors.deepOrangeAccent,
            backgroundColor: Colors.transparent,
            minHeight: 4,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.black, fontSize: 36),
                ),
                const SizedBox(height: 30),

                // Username ----------------------------------------------------
                TextField(
                  controller: _usernameTextController,
                  cursorColor: Colors.deepOrangeAccent,
                  keyboardType: TextInputType.text,
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
                // const SizedBox(height: 10),
                // TextField(
                //   controller: _emailTextController,
                //   cursorColor: Colors.deepOrangeAccent,
                //   decoration: InputDecoration(
                //     labelText: 'Email',
                //     labelStyle: const TextStyle(
                //       fontSize: 20,
                //       color: Colors.grey,
                //     ),
                //     focusedBorder: const UnderlineInputBorder(
                //       borderSide: BorderSide(color: Colors.deepOrangeAccent),
                //     ),
                //     errorText: _emailError,
                //     errorBorder: UnderlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         color: Colors.red.shade300,
                //         width: 2,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),

                // Mobile ------------------------------------------------------
                TextField(
                  controller: _mobileTextController,
                  cursorColor: Colors.deepOrangeAccent,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
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
                  // decoration: InputDecoration(
                  //   hintText: 'Phone Number',
                  //   // prefixStyle: const TextStyle(
                  //   //     color: Colors.black, backgroundColor: Colors.black),
                  //   // prefix: DropdownButton<int>(
                  //   //   hint: const Text('PreFix'),
                  //   //   style: const TextStyle(color: Colors.black),
                  //   //   value: preFixId,
                  //   //   onChanged: (int? value) {
                  //   //     setState(() {
                  //   //       preFixId = value!;
                  //   //     });
                  //   //   },
                  //   //   items: _preFixes.map((PreFixNumber pre) {
                  //   //     return DropdownMenuItem<int>(
                  //   //         value: pre.id,
                  //   //         child: Row(
                  //   //           children: [pre.image, Text(pre.preFix)],
                  //   //         ));
                  //   //   }).toList(),
                  //   // ),
                  //   hintStyle: const TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.grey,
                  //   ),
                  //   focusedBorder: const UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  //   ),
                  //   errorText: _phoneNumberError,
                  //   errorBorder: UnderlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: BorderSide(
                  //       color: Colors.red.shade300,
                  //       width: 2,
                  //     ),
                  //   ),
                  // ),
                ),
                const SizedBox(height: 10),

                // Password ----------------------------------------------------
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
                const SizedBox(height: 20),

                // Gender ------------------------------------------------------
                const Text(
                  'Gender',
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                          title: const Text(
                            'Male',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          activeColor: Colors.deepOrangeAccent,
                          value: 'M',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) selectedGender = value;
                            });
                          }),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                          title: const Text(
                            'Female',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          selectedTileColor: Colors.deepOrangeAccent,
                          activeColor: Colors.deepOrangeAccent,
                          value: 'F',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) selectedGender = value;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // City --------------------------------------------------------
                const Text(
                  'City',
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
                FutureBuilder<List<City>>(
                  future: _futureCities,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LinearProgressIndicator(
                          color: Colors.deepOrangeAccent,
                          backgroundColor: Colors.grey.shade200,
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      cities = snapshot.data!;
                      return DropdownButton<int>(
                        menuMaxHeight: 200,
                        hint: const Text('Select City'),
                        onTap: () {},
                        onChanged: (int? value) {
                          setState(() {
                            _selectedCity = value;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        value: _selectedCity,
                        items: cities.map((City city) {
                          return DropdownMenuItem<int>(
                              value: city.id, child: Text(city.nameEn));
                        }).toList(),
                      );
                    } else {
                      return DropdownButton<int>(
                          menuMaxHeight: 200,
                          hint: const Text('Select City'),
                          onTap: () {},
                          onChanged: (int? value) {},
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: _selectedCity,
                          items: const []);
                    }
                  },
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
                const SizedBox(height: 20),
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

  void _changeProgressValue({required double? value}) {
    setState(() {
      _progressValue = value;
    });
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
    // bool email = checkEmail();
    bool mobile = checkMobile();
    bool password = checkPassword();
    bool confirmPassword = checkConfirmPassword();
    bool gender = checkGender();

    setState(() {
      _usernameError = !username ? 'Enter username !' : null;
      // _emailError = !email ? 'Enter email !' : null;
      _phoneNumberError = !mobile ? 'Enter phone number !' : null;
      _passwordError = !password ? 'Enter password !' : null;
      _confirmPasswordError =
          !confirmPassword ? 'Enter confirm password !' : null;
    });
    // if (username && email && phoneNumber && password && confirmPassword) {
    if (username &&
        mobile &&
        gender &&
        checkCity() &&
        password &&
        confirmPassword) {
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

  // bool checkEmail() {
  //   if (_emailTextController.text.isNotEmpty) {
  //     if (_emailTextController.text.contains('@')) {
  //       return true;
  //     } else {
  //       showSnackBar(
  //           context: context,
  //           message: 'Enter correct email!',
  //           error: true,
  //           time: 1);
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

  bool checkMobile() {
    if (_mobileTextController.text.isNotEmpty) {
      if (_mobileTextController.text.length >= 7) {
        return true;
      } else {
        // showSnackBar(
        //     context: context,
        //     message: 'Enter correct mobile by Length >= 7!',
        //     error: true,
        //     time: 1);
        _phoneNumberError = 'Enter correct mobile by Length >= 7!';
        return false;
      }
    } else {
      return false;
    }
  }

  bool checkGender() {
    if (selectedGender != null) {
      return true;
    }
    // showSnackBar(
    //     context: context, message: 'Choose the gender!', error: true, time: 1);
    return false;
  }

  bool checkCity() {
    if (_selectedCity != null) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_passwordTextController.text.isNotEmpty) {
      if (_passwordTextController.text.length >= 4) {
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
      if (_confirmPasswordTextController.text.length >= 4) {
        if (_confirmPasswordTextController.text ==
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

  Future<void> signUp() async {
    String mobile = _mobileTextController.text.startsWith('0')
        ? _mobileTextController.text
            .substring(1, _mobileTextController.text.length)
        : _mobileTextController.text;
    _changeProgressValue(value: null);
    bool status = await CustomerApiController().register(
      name: _usernameTextController.text,
      mobile: mobile,
      password: _passwordTextController.text,
      gender: selectedGender!,
      STORE_API_KEY: '9eb71226-2d8b-46ae-85e9-15da79efe7c2',
      cityId: _selectedCity.toString(),
      context: context,
    );
    _changeProgressValue(value: status ? 1 : 0);
    if (status) {
      CustomerInformationGetXController.to.setPhoneNumber(_mobileTextController.text);
      Navigator.pushReplacementNamed(context, '/confirm_phone_number');
    }
  }
}
