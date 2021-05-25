import 'package:eldoctor/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/settings_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.person),
        iconSize: 28.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: const Icon(Icons.notifications),
        //   iconSize: 28.0,
        //   onPressed: () {},
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
