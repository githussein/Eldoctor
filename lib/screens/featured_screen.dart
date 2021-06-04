import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

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
                  'تنبيهات مهمة',
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
                onTap: () => UrlLauncher.launch('tel:+962797543452'),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(cardInnerPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/reminder.png",
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'مواعيد الأدوية',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => UrlLauncher.launch('tel:+962797543452'),
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
                        'المراكز الطبية',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
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
                onTap: () => UrlLauncher.launch('tel:+962797543452'),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(cardInnerPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/vaccine.png",
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'تذكير بالمطاعيم',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => UrlLauncher.launch('tel:+962797543452'),
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
                        'توصيل الأدوية',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
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
