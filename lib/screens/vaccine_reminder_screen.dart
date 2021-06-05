import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/screens.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class VaccineReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Palette.primaryColor,
          title: Text(
            'تنبيهات الأدوية',
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
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/vaccine.png",
                width: 100,
              ),
              SizedBox(height: 20),
              Text(
                'ليس لديك تنبيهات بأية مطاعيم جديدة',
                // textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchMapsUrl(double lat, double lon) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
