import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/services/database.dart';
import 'package:eldoctor/utils/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookingScreenState();
  }
}

class BookingScreenState extends State<BookingScreen> {
  String _name;
  String _address;
  String _password;
  String _url;
  String _phone;
  String _calories;

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
      decoration: InputDecoration(labelText: 'رقم التليفون'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'برجاء كتابة رقم التليفون للتواصل';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'أدوية تتناولها حاليا'),
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          // return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          title: Text('حجز موعد'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildName(),
                  _buildAddress(),
                  // _buildPassword(),
                  _builURL(),
                  _buildPhoneNumber(),
                  _buildCalories(),
                  SizedBox(height: 100),
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
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        var firebaseUser = FirebaseAuth.instance.currentUser;

                        print('BOOKING:::uid::: ${firebaseUser.uid}');

                        await DatabaseService(uid: firebaseUser.uid)
                            .updateBookingData(
                          _name,
                          _address,
                          _phone,
                        );
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'تم تأكيد الحجز وسيتم التواصل معك في أقرب وقت ممكن'),
                      ));

                      _formKey.currentState.save();

                      print(_name);
                      print(_address);
                      print(_phone);
                      print(_url);
                      print(_password);
                      print(_calories);

                      //Send to API
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

  void registerBooking() async {
    print('BOOOOOOKING:::::::::uid::::: ${UserPreferences.uid}');
    await DatabaseService(uid: UserPreferences.uid).updateBookingData(
      _name,
      _address,
      _phone,
    );
  }
}
