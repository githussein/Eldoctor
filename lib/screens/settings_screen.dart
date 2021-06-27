import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _dark;

  FirebaseAuth _auth;
  User _user;
  bool isLoading = true;

  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  String _textToShare =
      'تطبيق يحتوي خدمات صحية من مختلف التخصصات - حمل تطبيق Doctors & Nurses \n\nhttps://bit.ly/3z3iwgP';

  @override
  void initState() {
    super.initState();
    _dark = false;

    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    print('USER: $_user');
    isLoading = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Palette.primaryColor,
          title: Text(
            AppLocalizations.of(context).translate('settings'),
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
            // IconButton(
            //   icon: Icon(FontAwesomeIcons.moon),
            //   onPressed: () {
            //     setState(() {
            //       _dark = !_dark;
            //     });
            //   },
            // )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Palette.primaryColor,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                      title: Text(
                        '${FirebaseAuth.instance.currentUser.displayName}',
                        // '${firestoreInstance.collection("Users").doc(firebaseUser.uid).get().then((value) => value.data()["name"])}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://image.flaticon.com/icons/png/512/236/236831.png'),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.info,
                            color: Palette.primaryColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context).translate('about'),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  AppLocalizations.of(context)
                                      .translate('about'),
                                  textDirection: TextDirection.rtl,
                                ),
                                content: const Text(
                                  'هي منصة إلكترونية لتقديم الخدمات الصحية من مختلف التخصصات حيث تصلك بكادرٍ مميزٍ من الأطباء والممرضين وأخصائيي العلاج الطبيعي على مدار الساعة لتلبية احتياجاتِكَ الطّبية وتزويدِكَ بأفضلِ رعايةٍ أينما كنت.',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('إغلاق'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: Palette.primaryColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context).translate('privacy'),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PrivacyPolicyScreen()));
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.info,
                            color: Palette.primaryColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context).translate('rate'),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'هل أعجبك التطبيق؟',
                                  textDirection: TextDirection.rtl,
                                ),
                                content: const Text(
                                  'إذا أعجبك التطبيق فيسعدنا أن تقوم بتقييم التطبيق على متجر التطبيقات.',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('إغلاق'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.share,
                            color: Palette.primaryColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context).translate('share'),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_left),
                          onTap: () {
                            Share.share(_textToShare);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    AppLocalizations.of(context).translate('general-settings'),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.primaryColor,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Palette.primaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text(
                      AppLocalizations.of(context).translate('receive-notifs'),
                    ),
                    onChanged: (val) {},
                  ),
                  // SwitchListTile(
                  //   activeColor: Palette.primaryColor,
                  //   contentPadding: const EdgeInsets.all(0),
                  //   value: false,
                  //   title: Text("Received newsletter"),
                  //   onChanged: null,
                  // ),
                  // SwitchListTile(
                  //   activeColor: Palette.primaryColor,
                  //   contentPadding: const EdgeInsets.all(0),
                  //   value: true,
                  //   title: Text("Received Offer Notification"),
                  //   onChanged: (val) {},
                  // ),
                  // SwitchListTile(
                  //   activeColor: Palette.primaryColor,
                  //   contentPadding: const EdgeInsets.all(0),
                  //   value: true,
                  //   title: Text("Received App Updates"),
                  //   onChanged: null,
                  // ),
                  const SizedBox(height: 40.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Palette.primaryColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context).translate('sign-out'),
                          ),
                          onTap: () async {
                            /// Method to Logout the FirebaseUser
                            try {
                              await FirebaseAuth.instance.signOut();
                              _user = null;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('تم تسجيل الخروج بنجاح'),
                              ));

                              //Navigate to login screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),
            // Positioned(
            //   bottom: -20,
            //   left: -20,
            //   child: Container(
            //     width: 80,
            //     height: 80,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Palette.primaryColor,
            //       shape: BoxShape.circle,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 00,
            //   left: 00,
            //   child: IconButton(
            //     icon: Icon(
            //       FontAwesomeIcons.powerOff,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       //log out
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
