
import 'dart:convert';
import 'dart:io';

import 'package:new4shop010622/models/customer.dart';
import 'package:new4shop010622/network/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:new4shop010622/prefs/customer_preference_controller.dart';
class CustomerApiController{

  Future<bool> login({required String mobile,
  required String password,}) async{
    var url = Uri.parse(ApiSettings.LOGIN);
    var response = await http.post(url,body: {
      'mobile':mobile,
      'password':password,
    });

    if(response.statusCode == 200){
      print('Success');
      var jsonResponse = jsonDecode(response.body);
      Customer customer = Customer.fromJson(jsonResponse['data']);
      CustomerPreferenceController().saveCustomer(customer: customer);
      return true;
    }else if(response.statusCode == 400){

    }else{

    }
    return false;
  }

  Future<bool> logout() async{
    var url = Uri.parse(ApiSettings.LOGOUT);
    var response = await http.get(url,headers: {
      HttpHeaders.authorizationHeader: CustomerPreferenceController().token,
      HttpHeaders.acceptHeader:'application/json'
    });

    print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode == 401){
      await CustomerPreferenceController().logout();
      return true;
    }else{

    }
    return false;
  }


}