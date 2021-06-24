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
  //
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  String _name = '';
  String _email = '';
  String _phone = '';
  String _about = 'لا يوجد تفاصيل';

  // _name = userCollection.doc(widget.myUserID).get().toString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyUser myUserPref = UserPreferences.userPref;

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
                  icon: Icon(Icons.save),
                  //Save user preferences
                  onPressed: () async {
                    var firebaseUser = FirebaseAuth.instance.currentUser;

                    await DatabaseService(uid: firebaseUser.uid).updateUserData(
                      UserPreferences.userPref.name,
                      UserPreferences.userPref.email,
                      UserPreferences.userPref.phone,
                      UserPreferences.userPref.about,
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
            body: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 36),
                  ProfileWidget(
                    imagePath: myUserPref.imagePath,
                    isEdit: true,
                    onClicked: () async {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'الاسم',
                    text: myUserPref.name,
                    onChanged: (name) {
                      myUserPref.name = name;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'البريد الالكتروني',
                    text: myUserPref.email,
                    onChanged: (email) {
                      myUserPref.email = email;
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
                    text: myUserPref.about,
                    maxLines: 5,
                    onChanged: (about) {
                      myUserPref.phone = about;
                    },
                  ),
                  const SizedBox(height: 24),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    color: Palette.primaryColor,
                    child: Text(
                      'حفظ التعديلات',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        return;
                      }

                      _formKey.currentState.save();

                      var firebaseUser = FirebaseAuth.instance.currentUser;

                      //Send to API
                      //Update Firebase database Bookings collection
                      await DatabaseService(uid: firebaseUser.uid)
                          .updateUserData(
                        _name,
                        _email,
                        _phone,
                        _about,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('تم حفظ التعديلات بنجاح'),
                      ));
                      //Navigate to main screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      );
}
