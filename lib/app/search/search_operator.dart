import 'package:flutter/material.dart';

class SearchOperator extends StatelessWidget {
  double width;
  double radius;
  bool isSuffix;

  SearchOperator(
      {this.width = 375, this.radius = 0, this.isSuffix = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        width: width,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.grey.shade100,
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            prefixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Visibility(
                  visible: isSuffix,
                  child: Image.asset('images/app/path16610.png')),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
