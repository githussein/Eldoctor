import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class CoronaScreen extends StatefulWidget {
  @override
  _Corona createState() => _Corona();
}

class _Corona extends State<CoronaScreen> {
  String _country = 'JO';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildTips(screenHeight),
          _buildTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          // borderRadius: BorderRadius.only(
          //   bottomRight: Radius.circular(40.0),
          //   bottomLeft: Radius.circular(40.0),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // CountryDropdown(
                //   countries: [
                //     'JO',
                //     'EG',
                //     'AU',
                //     'IT',
                //     'US',
                //     'RU',
                //   ],
                //   country: _country,
                //   onChanged: (val) => setState(() => _country = val),
                // ),
                Text(
                  'فيروس كورونا',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                Image.asset(
                  'assets/images/jo_flag.png',
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'تشعر أنك لست بخير؟',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'إذا ظهرت عليك أيا من أعراض كورونا برجاء التواصل معنا',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () {
                          UrlLauncher.launch('tel:+962789241999');
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: Colors.green.shade800,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        label: Text(
                          'اتصل الآن',
                          style: Styles.buttonTextStyle,
                        )),
                    FlatButton.icon(
                        onPressed: () {
                          UrlLauncher.launch('sms:+962789241999');
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ارسل رسالة',
                          style: Styles.buttonTextStyle,
                        )),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'نصائح هامة',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 0.1,
              width: 100,
              color: Palette.secondaryColor,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map(
                    (e) => Column(
                      children: <Widget>[
                        Image.asset(
                          e.keys.first,
                          height: screenHeight * 0.12,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          e.values.first,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        )
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        padding: EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue, Palette.primaryColor]),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/test.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'إجراء تحليل كورونا',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'اتبع التعليمات للقيام بتحليل كورونا',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                  ),
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
