import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/booking_screen.dart';
import 'package:eldoctor/screens/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class DoctorsScreen extends StatefulWidget {
  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  BoxDecoration doctorsListBD = BoxDecoration(
    border: Border.all(color: Colors.grey),
    color: Colors.white70,
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text('اختر التخصص'),
      ),
      body: ListView(
          // primary: false,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: doctorsListBD,
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
                      "طبيب عام",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/doctor.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: doctorsListBD,
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
                      "الجراحة العامة",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/doctor.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: doctorsListBD,
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
                      "أمراض الباطنة",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/doctor.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: doctorsListBD,
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
                      "طب النساء",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/doctor.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: doctorsListBD,
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
                      "طب الأطفال",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/doctor.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: doctorsListBD,
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
                      "الطب النفسي",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/doctor.png',
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
