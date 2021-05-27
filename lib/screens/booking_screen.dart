import 'package:eldoctor/config/palette.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookingScreenState();
  }
}

class BookingScreenState extends State<BookingScreen> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'الاسم'),
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

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'العنوان'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'العنوان مطلوب';
        }

        // if (!RegExp(
        //         r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        //     .hasMatch(value)) {
        //   return 'Please enter a valid email Address';
        // }

        return null;
      },
      onSaved: (String value) {
        _email = value;
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
      decoration: InputDecoration(labelText: 'وصف الحالة'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'برجاء كتابة وصف الحالة';
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
      keyboardType: TextInputType.number,
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
                  _buildEmail(),
                  // _buildPassword(),
                  _builURL(),
                  _buildPhoneNumber(),
                  _buildCalories(),
                  SizedBox(height: 100),
                  RaisedButton(
                    color: Palette.primaryColor,
                    child: Text(
                      'تأكيد الحجز',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'تم تأكيد الحجز وسيتم التواصل معك في أقرب وقت ممكن'),
                      ));

                      _formKey.currentState.save();

                      print(_name);
                      print(_email);
                      print(_phoneNumber);
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
}
