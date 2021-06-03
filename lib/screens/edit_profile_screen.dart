import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/model/user.dart';
import 'package:eldoctor/screens/screens.dart';
import 'package:eldoctor/utils/user_preferences.dart';
import 'package:eldoctor/widgets/dart/profile_widget.dart';
import 'package:eldoctor/widgets/dart/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  User user = UserPreferences.myUser;

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
                  onPressed: () {
                    //Create a new user in Firestore database

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
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'الاسم',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'البريد الالكتروني',
                  text: user.email,
                  onChanged: (email) {},
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
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
              ],
            ),
          ),
        ),
      );
}
