
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferenceController{

  static final UserPreferenceController _instance = UserPreferenceController._internal();

  late SharedPreferences _sharedPreferences;

  UserPreferenceController._internal();

  factory UserPreferenceController(){
    return _instance;
  }

  Future<void> initSharedPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveFirstOpenApp() async{
    _sharedPreferences.setBool('first_time', true);
  }

  bool get firstTime => _sharedPreferences.getBool('first_time') ?? false;

  Future<bool> clearApp() async{
    return _sharedPreferences.clear();
  }

}