import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/screens.dart';
import "package:flutter/material.dart";

class OtherServicesScreen extends StatefulWidget {
  @override
  _OtherServicesScreenState createState() => _OtherServicesScreenState();
}

class _OtherServicesScreenState extends State<OtherServicesScreen> {
  BoxDecoration doctorsListBD = BoxDecoration(
    border: Border.all(color: Colors.grey),
    color: Colors.white70,
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    double _scanSize = 14;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text('خدمات طبية أخرى'),
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
                        builder: (context) =>
                            BookingScreen('تصوير القلب بالصدى'),
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
                      'تصوير القلب بالصدى',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/echo.png',
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
                        builder: (context) => BookingScreen('تخطيط القلب'),
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
                      'تخطيط القلب',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/echo.png',
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
                        builder: (context) =>
                            BookingScreen('تخطيط أمواج الدماغ'),
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
                      'تخطيط أمواج الدماغ',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/brain.png',
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
                        builder: (context) =>
                            BookingScreen('التخطيط الكهربي للعضلات'),
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
                      'التخطيط الكهربي للعضلات',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/muscles.png',
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
                        builder: (context) => BookingScreen('دراسة النوم'),
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
                      'دراسة النوم',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/sleep.png',
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
                        builder: (context) => BookingScreen('الحجامة'),
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
                      'الحجامة',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/cupping.png',
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
                        builder: (context) => BookingScreen('تضميد الجرح'),
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
                      'تضميد الجرح',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/wound.png',
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
                        builder: (context) => BookingScreen('خياطة الجروح'),
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
                      'خياطة الجروح',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/sewing.png',
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
                        builder: (context) =>
                            BookingScreen('العناية الشخصية - الحلاقة'),
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
                      'العناية الشخصية - الحلاقة',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/care.png',
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
