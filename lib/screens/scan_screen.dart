import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/screens.dart';
import "package:flutter/material.dart";

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
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
        title: Text('قسم الأشعة'),
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
                            BookingScreen('التصوير بالأشعة السينية'),
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
                      'التصوير بالأشعة السينية',
                      style: TextStyle(
                          fontSize: _scanSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/xrays.png',
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: doctorsListBD,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) =>
            //                 BookingScreen('التصوير بالأمواج فوق الصوتية'),
            //           ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.arrow_back,
            //           color: Palette.primaryColor,
            //         ),
            //         Text(
            //           'التصوير بالأمواج فوق الصوتية',
            //           style: TextStyle(
            //               fontSize: _scanSize,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Image.asset(
            //           'assets/images/ultrasound.png',
            //           width: 60,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: doctorsListBD,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => BookingScreen('التصوير الطبقي'),
            //           ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.arrow_back,
            //           color: Palette.primaryColor,
            //         ),
            //         Text(
            //           'التصوير الطبقي',
            //           style: TextStyle(
            //               fontSize: _scanSize,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Image.asset(
            //           'assets/images/ct.png',
            //           width: 60,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: doctorsListBD,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) =>
            //                 BookingScreen('التصوير بالرنين المغناطيسي'),
            //           ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.arrow_back,
            //           color: Palette.primaryColor,
            //         ),
            //         Text(
            //           'التصوير بالرنين المغناطيسي',
            //           style: TextStyle(
            //               fontSize: _scanSize,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Image.asset(
            //           'assets/images/mri.png',
            //           width: 60,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: doctorsListBD,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => BookingScreen('تصوير الجنين'),
            //           ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.arrow_back,
            //           color: Palette.primaryColor,
            //         ),
            //         Text(
            //           'تصوير الجنين',
            //           style: TextStyle(
            //               fontSize: _scanSize,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Image.asset(
            //           'assets/images/babyscan.png',
            //           width: 60,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: doctorsListBD,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => BookingScreen('تخطيط القلب'),
            //           ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.arrow_back,
            //           color: Palette.primaryColor,
            //         ),
            //         Text(
            //           'تخطيط القلب',
            //           style: TextStyle(
            //               fontSize: _scanSize,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Image.asset(
            //           'assets/images/echo.png',
            //           width: 60,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 10),
            //   padding: EdgeInsets.all(10),
            //   decoration: doctorsListBD,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) =>
            //                 BookingScreen('تصوير القلب بالصدى'),
            //           ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.arrow_back,
            //           color: Palette.primaryColor,
            //         ),
            //         Text(
            //           'تصوير القلب بالصدى',
            //           style: TextStyle(
            //               fontSize: _scanSize,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Image.asset(
            //           'assets/images/echo.png',
            //           width: 60,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ]),
    );
  }
}
