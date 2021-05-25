import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import 'booking_screen.dart';

class NursingScreen extends StatefulWidget {
  @override
  _NursingScreenState createState() => _NursingScreenState();
}

class _NursingScreenState extends State<NursingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text('خدمات التمريض'),
      ),
      body: ListView(
          // primary: false,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                            // requiredService: 'd1',
                            ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Palette.primaryColor,
                    ),
                    Text(
                      "رعاية المسنين",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/nurse.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                            // requiredService: 'd1',
                            ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Palette.primaryColor,
                    ),
                    Text(
                      "رعاية طفل",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/nurse.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                            // requiredService: 'd1',
                            ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Palette.primaryColor,
                    ),
                    Text(
                      "خدمة التمريض السريع",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/nurse.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                            // requiredService: 'd1',
                            ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Palette.primaryColor,
                    ),
                    Text(
                      "خدمة المناوبة بالمنزل",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/nurse.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                            // requiredService: 'd1',
                            ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Palette.primaryColor,
                    ),
                    Text(
                      "العناية بالجروح",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/nurse.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
