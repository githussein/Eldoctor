import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/data/data.dart';
import 'package:eldoctor/widgets/dart/bar_chart.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:eldoctor/widgets/dart/stats_grid.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
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
      padding: const EdgeInsets.all(10.0),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Text(
            'دوائـي اكستراممم',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.purple,
            ),
            labelStyle: Styles.tabTextStyle,
            // unselectedLabelColor: Colors.black,
            tabs: <Widget>[
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index) {},
          ),
        ),
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
