import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldoctor/config/palette.dart';
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
            return ListView(children: getBookingsItems(snapshot));
          }),
    );
  }

  getBookingsItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                  color: Palette.primaryColor.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Palette.primaryColor.withOpacity(.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Text(
                          doc["service"],
                          // style: TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle),
                        color: Colors.red.shade900,
                        iconSize: 30,
                        onPressed: () => deleteBooking(doc["patient"]),
                      ),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //   padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  //   decoration: BoxDecoration(
                  //       color: Palette.primaryColor.withOpacity(.5),
                  //       borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  //   child: Text(
                  //     doc["gender"],
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  Divider(color: Palette.secondaryColor, thickness: .5),
                  InkWell(
                    onTap: () => UrlLauncher.launch('tel:$doc["phone"]'),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Column(
                            children: [
                              Text(
                                doc["patient"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              Text(doc["gender"]),
                            ],
                          ),
                          trailing: Icon(
                            Icons.call,
                            color: Colors.green.shade700,
                            size: 30,
                          ),
                          title: Text(
                            doc["phone"],
                            textDirection: TextDirection.ltr,
                          ),
                          subtitle: Text(
                            doc["address"],
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'تاريخ:     ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                formatDate(doc["date"].toDate()),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Palette.secondaryColor, thickness: .5),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      doc["details"],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  Future deleteBooking(String patientName) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('Bookings');

    return users
        .doc(patientName)
        .delete()
        .then((value) => print("Booking Deleted"))
        .catchError((error) => print("Failed to delete booking: $error"));
  }

  String formatDate(DateTime myDate) {
    return myDate.day.toString() +
        '/' +
        myDate.month.toString() +
        '/' +
        myDate.year.toString();
  }
}
