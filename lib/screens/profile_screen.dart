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
    final user = UserPreferences.myUser;

    return Builder(
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            //iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
            backgroundColor: Palette.primaryColor,
            title: Text(
              'الملف الشخصي',
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
          // appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 36),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        //TODO pass the user ID
                        builder: (context) => EditProfileScreen('')),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              // const SizedBox(height: 24),
              // Center(child: buildUpgradeButton()),
              // const SizedBox(height: 24),
              // NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(MyUser user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {
          // Firebase
        },
      );

  Widget buildAbout(MyUser user) => Container(
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
              user.phone,
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
