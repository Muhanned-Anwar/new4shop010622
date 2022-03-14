import 'package:flutter/material.dart';
class Order {
  String id;
  String title;
  Color titleColor;
  String dateTime;
  String price;

  Order({
   required this.id,
   required this.title,
    this.titleColor = Colors.grey,
   required this.dateTime,
   required this.price,
  });
}
