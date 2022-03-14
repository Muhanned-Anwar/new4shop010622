
import 'package:flutter/material.dart';

class PreFixNumber{
  int _id;
  Image _image;
  String _preFix;

  PreFixNumber(this._id, this._image, this._preFix);

  String get preFix => _preFix;

  set prefix(String value) {
    _preFix = value;
  }

  Image get image => _image;

  set image(Image value) {
    _image = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}