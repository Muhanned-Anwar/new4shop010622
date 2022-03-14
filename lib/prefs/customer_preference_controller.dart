

import 'package:shared_preferences/shared_preferences.dart';

class CustomerPreferenceController {

  static final CustomerPreferenceController _instance = CustomerPreferenceController._internal();

  late SharedPreferences _sharedPreferences;


  CustomerPreferenceController._internal();

  factory CustomerPreferenceController(){
    return _instance;
  }

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveCustomer() async{}

  bool get loggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  String get token => _sharedPreferences.getString('token') ?? '';

  Future<bool> logout() async{
    return await _sharedPreferences.clear();
  }
}