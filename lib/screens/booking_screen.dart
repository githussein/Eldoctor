import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/services/database.dart';
import 'package:eldoctor/utils/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_screen.dart';

class BookingScreen extends StatefulWidget {
  //Ask for booking type
  final String _requiredService;
  BookingScreen(this._requiredService, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BookingScreenState();
  }
}

class BookingScreenState extends State<BookingScreen> {
  String _name = '';
  String _address = '';
  String _password = '';
  String _url = '';
  String _phone = '';
  String _gender = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'اسم الحالة'),
      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'الاسم مطلوب';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  //Form address field
  Widget _buildAddress() {
    return TextFormField(
      maxLines: 2,
      decoration: InputDecoration(labelText: 'العنوان'),
      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'العنوان مطلوب';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'تكملة العنوان'),
      keyboardType: TextInputType.url,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     // return 'URL is Required';
      //   }
      //
      //   return null;
      // },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(labelText: 'رقم التليفون'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'برجاء كتابة رقم التليفون للتواصل';
        }

        return null;
      },
      onSaved: (String value) {
        _phone = value;
      },
    );
  }

  Widget _buildGender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'تفاصيل الحالة'),
      maxLines: 5,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          // return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _gender = value;
      },
    );
  }

  Widget _buildRequiredService() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(.5),
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Text(
        widget._requiredService,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          title: Text(
            'حجز موعد',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildRequiredService(),
                  SizedBox(height: 10),
                  _buildName(),
                  SizedBox(height: 10),
                  _buildAddress(),
                  // _buildPassword(),
                  // _builURL(),
                  SizedBox(height: 10),
                  _buildPhoneNumber(),
                  SizedBox(height: 10),
                  _buildGender(),
                  SizedBox(height: 50),
                  RaisedButton(
                    color: Palette.primaryColor,
                    child: Text(
                      'تأكيد الحجز',
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
                          .updateBookingData(
                        widget._requiredService,
                        _name,
                        _address,
                        _phone,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'تم تأكيد الحجز وسيتم التواصل معك في أقرب وقت ممكن'),
                      ));

                      //For debugging
                      print(_name);
                      print(_address);
                      print(_phone);
                      print(_url);
                      print(_password);
                      print(_gender);
                      //Navigate to main screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
