import 'package:new4shop010622/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerPreferenceController {

  static final CustomerPreferenceController _instance = CustomerPreferenceController._internal();

  late SharedPreferences _customerSharedPreferences;



  CustomerPreferenceController._internal();

  factory CustomerPreferenceController(){
    return _instance;
  }

  Future<void> initSharedPreferences() async {
    _customerSharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> saveFirstOpenApp() async{
    _customerSharedPreferences.setBool('first_time', true);
  }

  bool get firstTime => _customerSharedPreferences.getBool('first_time') ?? false;

  Future<void> saveCustomer({required Customer customer}) async{
    _customerSharedPreferences.setBool('logged_in', true);
    _customerSharedPreferences.setInt('id', customer.id);
    _customerSharedPreferences.setString('name', customer.name);
    _customerSharedPreferences.setString('email', customer.email ?? 'No has email');
    _customerSharedPreferences.setString('mobile', customer.mobile);
    _customerSharedPreferences.setString('gender', customer.gender);
    _customerSharedPreferences.setBool('active', customer.active);
    _customerSharedPreferences.setBool('verified', customer.verified);
    _customerSharedPreferences.setInt('city_id', customer.cityId);
    _customerSharedPreferences.setInt('store_id', customer.storeId);
    _customerSharedPreferences.setString('fcm_token', "Bearer ${customer.fcmToken}");
    _customerSharedPreferences.setString('token', "Bearer ${customer.token}");
    _customerSharedPreferences.setString('token_type', customer.tokenType);
    _customerSharedPreferences.setString('refresh_token', "Bearer ${customer.refreshToken}");
    _customerSharedPreferences.setString('city_name_en', customer.city.nameEn);
    _customerSharedPreferences.setString('city_name_ar', customer.city.nameAr);
    _customerSharedPreferences.setString('store_sales_man_name', customer.store.name);
    _customerSharedPreferences.setString('store_store_name', customer.store.storeName);
    _customerSharedPreferences.setString('store_email', customer.store.email);
    _customerSharedPreferences.setString('store_email_verified_at', customer.store.emailVerifiedAt ?? '');
    _customerSharedPreferences.setString('store_mobile', customer.store.mobile);
    _customerSharedPreferences.setString('store_store_uuid', customer.store.storeUuid ?? '');
    _customerSharedPreferences.setInt('store_city_id', customer.store.cityId);
    _customerSharedPreferences.setString('store_verification_code', customer.store.verificationCode ?? '');
    _customerSharedPreferences.setInt('store_active', customer.store.active);
    _customerSharedPreferences.setInt('store_verified', customer.store.verified);
    _customerSharedPreferences.setString('store_firebase_key', customer.store.firebaseKey ?? '');
    _customerSharedPreferences.setString('store_image', customer.store.image ?? '');
    _customerSharedPreferences.setString('store_address', customer.store.address);
    _customerSharedPreferences.setString('store_facebook', customer.store.facebook ?? '');
    _customerSharedPreferences.setString('store_instagram', customer.store.instagram ?? '');
    _customerSharedPreferences.setString('store_created_at', customer.store.createdAt);
    _customerSharedPreferences.setString('store_updated_at', customer.store.updatedAt);
  }

  bool get loggedIn => _customerSharedPreferences.getBool('logged_in') ?? false;

  String get token => _customerSharedPreferences.getString('token') ?? '';

  Future<bool> logout() async{
    bool status = await _customerSharedPreferences.clear();
    saveFirstOpenApp();
    return status;
  }
}