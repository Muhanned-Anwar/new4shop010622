import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final bool selected;
  final double marginEnd;
  final Color color;
  final Color elseColor;

  const PageViewIndicator({
    Key? key,
    required this.selected,
    this.marginEnd = 0,
    this.color = Colors.black,
    this.elseColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      margin: EdgeInsets.only(right: marginEnd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: selected ? color : elseColor,
      ),
    );
  }
}
