import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';

import 'bottom_nav_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.primaryColor,
        title: Text(
          'قائمة الحجوزات',
          style: TextStyle(
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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Bookings').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return new ListView(children: getExpenseItems(snapshot));
          }),
    );
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                  color: Palette.primaryColor.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    decoration: BoxDecoration(
                        color: Palette.primaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Text(
                      doc["service"],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    onTap: () => UrlLauncher.launch('tel:$doc["phone"]'),
                    child: ListTile(
                      leading: Text(doc["patient"]),
                      trailing: Icon(Icons.call),
                      title: Text(
                        doc["phone"],
                        textDirection: TextDirection.ltr,
                      ),
                      subtitle: Text(
                        doc["address"],
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
