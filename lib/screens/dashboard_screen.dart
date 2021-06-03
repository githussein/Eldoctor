import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Bookings').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return new ListView(children: getExpenseItems(snapshot));
          }),
    );
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => new ListTile(
            title: new Text(doc["patient"]),
            subtitle: new Text(doc["address"].toString())))
        .toList();
  }
}
