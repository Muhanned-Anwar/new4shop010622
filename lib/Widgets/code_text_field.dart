import 'package:flutter/material.dart';

class CodeTextField extends StatelessWidget {
  final TextEditingController codeTextController;
  final FocusNode focusNode;
  final void Function(String value) onChanged;

  String? _usernameError;
  String? _emailError;
  String? _phoneNumberError;
  String? _passwordError;
  String? _confirmPasswordError;

  CodeTextField({Key? key,
   required this.codeTextController,
   required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: codeTextController,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      maxLength: 1,
      cursorColor: Colors.deepOrangeAccent,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
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
    );
  }
}
