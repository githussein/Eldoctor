import 'package:eldoctor/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text('سياسة الخصوصية'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              '\n• Our app is free to download. \n This service is provided free of charge with the exception of services to contact doctors and is intended for use as is.  .  \n\n• This page is used to inform visitors of our policies for the collection, use, and disclosure of personal information if anyone decides to use our service. If you choose to use our service, then you agree to the collection and use of information related to this policy.  Personal information we collect to provide and improve the Service.  We will not use or share your information with anyone except as described in this Privacy Policy.  \n\n• The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which can be accessed in Unless otherwise specified, Information Collection and Use of This Privacy Policy \n\n1. For a better experience, while using our Service, we may ask you to provide us  With certain personally identifiable information, including but not limited to an email address.  \n\nInformation requested by us will be retained and used by us as described in this Privacy Policy \n2. The Application uses third party services that may collect information used to identify you.  \n\n• Log data \n\nWe would like to inform you that whenever you use our service, in the event of an application error, we collect data and information (through third-party products) on your phone called Log Data.  This Log Data may include information such as your device\'s Internet Protocol address, device name, operating system version, the configuration of the Application when you use our Service, the time and date of your use of the Service, and other statistics.  \n\n• Cookies \n\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers.  They are sent to your browser from the websites you visit and are stored on your internal device.\n\n',
            ),
          ),
        ],
      ),
    );
  }
}
