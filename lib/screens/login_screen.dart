import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/model/user.dart';
import 'package:eldoctor/screens/edit_profile_screen.dart';
import 'package:eldoctor/services/database.dart';
import 'package:eldoctor/utils/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //store the uid to share it later
  String myUserID = '';

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  String countryCode = '+49';
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      //For debugging to see if a user was actually created
      print('USER DATA: ${authCredential.user}');

      //SUCCESSFUL LOG IN
      if (authCredential?.user != null) {
        //Save the user id
        // MyUser myUser = new MyUser();
        myUserID = authCredential.user.uid;
        UserPreferences.uid = authCredential.user.uid;

        //Create a new document for that user with its uid
        await DatabaseService(uid: authCredential.user.uid).updateUserData(
            'Muhamed Samy', 'muhamed.samy1@gmail.com', '+201005579290', '');

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditProfileScreen(authCredential.user.uid)));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
        '?????? ?????????? ???????????? ?????? ????????',
        textDirection: TextDirection.rtl,
      )));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        Text(
          '???????? ?????? ???????????? ?????????????? ???????????? ????????????',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '',
            suffix: Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                '$countryCode',
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          maxLength: 11,
          keyboardType: TextInputType.number,
          controller: phoneController,
        ),
        SizedBox(
          height: 20,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('?????? ???????? ?????????? ?????? ????????????'),
              ));
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: 'Verify $countryCode-${phoneController.text}',
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                  '?????? ?????? ???????????? ?????????? ???????????? ?????? ??????????',
                  textDirection: TextDirection.rtl,
                )));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("?????????? ?????? ????????????"),
          color: Palette.primaryColor,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        ),
        Spacer(),
      ],
    );
  }

  //OTP State
  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        Text(
          '?????????? ?????????? ?????? ?????? ???????????? ???????????? ???? 6 ??????????',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 40,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: otpController,
          decoration: InputDecoration(
            hintText: "_   _   _   _   _   _",
            hintTextDirection: TextDirection.ltr,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text(
            "?????????? ??????????",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          color: Palette.primaryColor,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          title: Text('?????????? ????????????'),
        ),
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}
