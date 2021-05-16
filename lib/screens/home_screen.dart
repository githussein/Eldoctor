import 'package:eldoctor/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  final ServicesScroller servicesScroller = ServicesScroller();
  final OthersScroller othersScroller = OthersScroller();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildCategories(screenHeight),
          _buildQuickServices(screenHeight),
          _buildOthers(screenHeight),
          _buildTips(screenHeight),
        ],
      ),
    );
  }

  //____________ Screen Element 1 ____________ //
  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'تطبيق دوائـي',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
            Text(
              'نأمل أن تكون بحال أفضل اليوم',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }

  //____________ Screen Element 2 ____________ //
  SliverToBoxAdapter _buildCategories(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'اختر التخصص',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            categoriesScroller,
          ],
        ),
      ),
    );
  }

  //____________ Screen Element 3 ____________ //
  SliverToBoxAdapter _buildQuickServices(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'خدمات سريعة',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            servicesScroller,
          ],
        ),
      ),
    );
  }

  //____________ Screen Element 3 ____________ //
  SliverToBoxAdapter _buildOthers(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'خدمات أخرى',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            othersScroller,
          ],
        ),
      ),
    );
  }

  //____________ Screen Element 4 ____________ //
  SliverToBoxAdapter _buildTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}

//____________ Class CategoriesScroller ____________ //
class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.2;
    final double categoryWidth = 88.0;
    final double cardInnerSpace = 12.0;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.all(cardInnerSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/test.png'),
                      Text(
                        "لقاحات",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.all(cardInnerSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/test.png'),
                      Text(
                        "لقاحات",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.all(cardInnerSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/test.png'),
                      Text(
                        "لقاحات",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.all(cardInnerSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/test.png'),
                      Text(
                        "لقاحات",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.all(cardInnerSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/test.png'),
                      Text(
                        "لقاحات",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//____________ Class ServicesScroller ____________ //
class ServicesScroller extends StatelessWidget {
  const ServicesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.2;
    final double categoryWidth = 150.0;
    final double cardInnerSpace = 12.0;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/test.png',
                        height: 60,
                      ),
                      Text(
                        "فحص كورونا",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                        color: Colors.grey,
                      ),
                      Text(
                        "BOOK NOW",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/test.png',
                        height: 60,
                      ),
                      Text(
                        "خدمة التمريض السريع",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                        color: Colors.grey,
                      ),
                      Text(
                        "BOOK NOW",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/test.png',
                        height: 60,
                      ),
                      Text(
                        "طبيب عام",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                        color: Colors.grey,
                      ),
                      Text(
                        "BOOK NOW",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//____________ Class ServicesScroller ____________ //
class OthersScroller extends StatelessWidget {
  const OthersScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.18;
    final double categoryWidth = 250.0;
    final double cardInnerSpace = 12.0;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "سحب العينات مجانا",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "اتطمن على صحة الحاج \nوالحاجة واطلب فحص...",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/test.png',
                        width: 90,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "أسعار الخدمات",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "زيارة طبيب طواريء \nمنزلي...",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/test.png',
                        width: 90,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "أسعار فحص كورونا",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "يعتمد سعر فحص كورونا\n على سرعة ودقة...",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/test.png',
                        width: 90,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
