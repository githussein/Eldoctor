import 'package:eldoctor/app_localizations.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/screens/reminders_screen.dart';
import 'package:eldoctor/screens/vaccine_reminder_screen.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          // _buildStatsBAr(),
          // SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.0),
          //   sliver: SliverToBoxAdapter(
          //     child: StatsGrid(),
          //   ),
          // ),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 10.0),
          //   sliver: SliverToBoxAdapter(
          //     child: CasesBarChart(
          //       casesList: dailyNewCasesDeList,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                // width: categoryWidth,
                // height: categoryHeight,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    )),
                child: Text(
                  AppLocalizations.of(context).translate('important-reminders'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    final double cardInnerPadding = 30.0;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RemindersScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(cardInnerPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/reminder.png",
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)
                            .translate('medicament-reminder'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    _launchMapsUrl(31.955774504111634, 35.928382332939805),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(cardInnerPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/hospital.png",
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)
                            .translate('medial-centres'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VaccineReminderScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(cardInnerPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/vaccine.png",
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)
                            .translate('vaccine-reminder'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                // onTap: () => UrlLauncher.launch('tel:+962797543452'),
                onTap: () => launch("https://wa.me/+962797543452?text=Hello"),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(cardInnerPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/delivery.png",
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)
                            .translate('medicament-delivery'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverPadding _buildStatsBAr() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.white54,
            tabs: <Widget>[
              Text('Today'),
              Text('Yesterday'),
              Text('Total'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}

//Launch maps
// void _launchMapsUrl(double lat, double lon) async {
void _launchMapsUrl(double lat, double lon) async {
  final url =
      'https://www.google.com/maps/search/%D9%85%D8%B1%D9%83%D8%B2+%D8%B7%D8%A8%D9%8A%E2%80%AD/@31.9639607,35.8271016,12z/data=!3m1!4b1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
