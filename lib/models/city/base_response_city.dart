import 'package:new4shop010622/models/city/city.dart';

class BaseResponseCity<T> {
  late bool? status;
  late String? message;
  late List<T> list;

  BaseResponseCity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['list'] != null) {
      if(T == City){
        list = <T>[];
        json['list'].forEach((v) {
          list.add(City.fromJson(v) as T);
        });
      }
    }
  }
}
