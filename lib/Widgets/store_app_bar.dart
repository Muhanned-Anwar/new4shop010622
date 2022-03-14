import 'package:flutter/material.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const StoreAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      // elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          letterSpacing: 3,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.work),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
