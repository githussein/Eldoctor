// import 'dart:html';

import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/model/user.dart';
import 'package:eldoctor/screens/screens.dart';
import 'package:eldoctor/services/database.dart';
import 'package:eldoctor/utils/user_preferences.dart';
import 'package:eldoctor/widgets/dart/profile_widget.dart';
import 'package:eldoctor/widgets/dart/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  final String myUserID;
  EditProfileScreen(this.myUserID, {Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  MyUser myUser = UserPreferences.myUser;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              //iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
              backgroundColor: Palette.primaryColor,
              title: Text(
                'تعديل الملف الشخصي',
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
                  icon: Icon(Icons.save),
                  //Save user preferences
                  onPressed: () async {
                    await DatabaseService(uid: widget.myUserID).updateUserData(
                      UserPreferences.myUser.name,
                      UserPreferences.myUser.email,
                      UserPreferences.myUser.phone,
                    );

                    // await userCollection.doc(widget.myUserID).set({
                    //   'name': myUser.name,
                    //   'email': myUser.email,
                    //   'phone': myUser.phone,
                    // });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavScreen()),
                    );
                  },
                )
              ],
            ),
            // appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 36),
                ProfileWidget(
                  imagePath: myUser.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'الاسم',
                  text: myUser.name,
                  onChanged: (name) {
                    UserPreferences.myUser.name = name;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'البريد الالكتروني',
                  text: myUser.email,
                  onChanged: (email) {
                    UserPreferences.myUser.email = email;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'وصف الحالة',
                  text: '',
                  maxLines: 5,
                  onChanged: (about) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'التاريخ المرضي',
                  text: '',
                  maxLines: 5,
                  onChanged: (about) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'نبذة عنك',
                  text: myUser.phone,
                  maxLines: 5,
                  onChanged: (about) {
                    UserPreferences.myUser.phone = about;
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
