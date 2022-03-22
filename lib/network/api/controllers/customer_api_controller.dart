import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:new4shop010622/models/customer.dart';
import 'package:new4shop010622/network/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:new4shop010622/prefs/customer_preference_controller.dart';
import 'package:new4shop010622/utils/helpers.dart';

import '../../../getX/customer_information_getX_controller.dart';

class CustomerApiController with Helpers {
  Future<bool> login({
    required String mobile,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      Customer customer = Customer.fromJson(jsonResponse['data']);
      CustomerPreferenceController().saveCustomer(customer: customer);
      return true;
    } else if (response.statusCode == 400) {
    } else {}
    return false;
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: CustomerPreferenceController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      await CustomerPreferenceController().logout();
      return true;
    } else {}
    return false;
  }

  Future<bool> register({
    required String name,
    required String mobile,
    required String password,
    required String gender,
    required String STORE_API_KEY,
    required String cityId,
    required BuildContext context,
  }) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'name': name,
      'mobile': mobile,
      'password': password,
      'gender': gender,
      'STORE_API_KEY': STORE_API_KEY,
      'city_id': cityId,
    });

    if (response.statusCode == 201) {
      showSnackBar(
          context: context, message: jsonDecode(response.body)['message']);
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['code'].toString(),
          time: 10);

      // CustomerInformationGetXController.to.setActiveCode(jsonDecode(response.body)['code'].toString());

      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else {
      showSnackBar(
          context: context,
          message: 'Something went wrong, please try again',
          error: true);
    }
    return false;
  }

  Future<bool> activate({
    required String mobile,
    required String code,
    required BuildContext context,
  }) async {
    var url = Uri.parse(ApiSettings.activate);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'code': code,
    });
    if (response.statusCode == 200) {
      showSnackBar(
          context: context, message: jsonDecode(response.body)['message']);
      return jsonDecode(response.body)['status'];
    } else if (response.statusCode == 400) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
      return jsonDecode(response.body)['status'];
    }
    return false;
  }

  Future<bool> forgetPassword({
    required String mobile,
    required BuildContext context,
  }) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(url, body: {'mobile': mobile});
    if (response.statusCode == 200) {
      showSnackBar(
          context: context, message: jsonDecode(response.body)['message']);
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['code'].toString(),
          time: 10);
      return jsonDecode(response.body)['status'];
    } else if (response.statusCode == 400) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
      return jsonDecode(response.body)['status'];
    }
    return false;
  }

  Future<bool> resetPassword({
    required String mobile,
    required String code,
    required String password,
    required String passwordConfirmation,
    required BuildContext context,
  }) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'code': code,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return jsonDecode(response.body)['status'];
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
      return jsonDecode(response.body)['status'];
    }
    return false;
  }
}
