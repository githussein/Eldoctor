import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_screen.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Palette.primaryColor,
          title: Text(
            'الإشعارات',
            style: TextStyle(
              // color: _dark ? Colors.white : Palette.primaryColor,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Text(
            'ليس لديك أي إشعارات جديدة حتى الآن',
            // textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
