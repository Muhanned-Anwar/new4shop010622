import 'package:flutter/material.dart';

class ExpansionTileMenu extends StatelessWidget {
  final String path;
  final String title;

  const ExpansionTileMenu({Key? key,
    required this.path,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Container(
        margin: const EdgeInsets.only(left: 25, right: 15, bottom: 10),
        child: Image.asset(path),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 23,
        ),
      ),
      childrenPadding: EdgeInsets.zero,
      tilePadding: EdgeInsets.zero,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'New Arrivals',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Belts',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Sunglasses',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Gloves',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Hats',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Scarves',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),),
          ],
        ),
      ],
      iconColor: Colors.black,
    );
  }
}
