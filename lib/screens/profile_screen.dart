import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/model/user.dart';
import 'package:eldoctor/screens/screens.dart';
import 'package:eldoctor/utils/user_preferences.dart';
import 'package:eldoctor/widgets/dart/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Palette.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.primaryColor,
          title: Text(
            'الملف الشخصي',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      //TODO pass the user ID
                      builder: (context) => EditProfileScreen('')),
                );
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Users').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return ListView(children: getUsersItems(snapshot));
            }),
      ),
    );
  }

  getUsersItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => Column(
              children: [
                const SizedBox(height: 36),
                ProfileWidget(
                  imagePath:
                      'https://image.flaticon.com/icons/png/512/236/236831.png',
                  onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          //TODO pass the user ID
                          builder: (context) => EditProfileScreen('')),
                    );
                  },
                ),
                const SizedBox(height: 24),
                buildName(
                  doc["name"],
                  doc["email"],
                ),
                buildPhone(doc["phone"]),
                // const SizedBox(height: 24),
                // Center(child: buildUpgradeButton()),
                // const SizedBox(height: 24),
                // NumbersWidget(),
                const SizedBox(height: 48),
                buildAbout(doc["about"]),
              ],
            ))
        .toList();
  }

  Widget buildName(String myName, String myEmail) => Column(
        children: [
          Text(
            myName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            myEmail,
            style: TextStyle(color: Colors.black38, fontSize: 16),
          )
        ],
      );

  Widget buildPhone(String myPhone) => Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'رقم التليفون',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(
            myPhone,
            style: TextStyle(color: Colors.black38, fontSize: 16),
            textDirection: TextDirection.ltr,
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {
          // Firebase
        },
      );

  Widget buildAbout(String myAbout) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نبذة عنك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              myAbout,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 16),
            Text(
              'العمر',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '27 سنة',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
