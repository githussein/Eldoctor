import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/screens/other_services_screen.dart';
import 'package:eldoctor/screens/scan_screen.dart';
import 'package:eldoctor/screens/screens.dart';
import 'package:eldoctor/shared/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eldoctor/widgets/dart/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:eldoctor/app_localizations.dart';
import 'booking_screen.dart';

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
          // borderRadius: BorderRadius.only(
          //   bottomRight: Radius.circular(30.0),
          //   bottomLeft: Radius.circular(30.0),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('app_title'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
            Text(
              AppLocalizations.of(context).translate('app_slogan'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('choose-category'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // textDirection: TextDirection.ltr,
              // textAlign: TextAlign.center,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('visit-clinic'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('prices'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
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
    final double categoryWidth = 120.0;
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
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorsScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/doctor.png'),
                        Text(
                          // 'doctors',
                          AppLocalizations.of(context).translate('doctors'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NursingScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/nurse.png'),
                        Text(
                          AppLocalizations.of(context).translate('nurses'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoronaScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/vaccine.png'),
                        Text(
                          AppLocalizations.of(context).translate('corona-test'),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.teal.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingScreen('علاج طبيعي')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/massage.png'),
                        Text(
                          AppLocalizations.of(context)
                              .translate('natural-therapy'),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () => UrlLauncher.launch('tel:+962797543452'),
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/test.png'),
                        Text(
                          AppLocalizations.of(context).translate('lab'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScanScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/scan.png'),
                        Text(
                          AppLocalizations.of(context).translate('scan'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen('تأجير معدات طبية')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/equipment.png'),
                        Text(
                          AppLocalizations.of(context)
                              .translate('medical-tools'),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen('إرشادات غذائية'),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/apple.png'),
                        Text(
                          AppLocalizations.of(context).translate('nutrition'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtherServicesScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(cardInnerSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/more.png'),
                        Text(
                          "other-services",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
    final Color bookNowTicket = Palette.primaryColor;

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
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen('عيادة المسالك البولية')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/kidneys.png',
                          height: 60,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('urology'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          color: Colors.grey,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('book-now'),
                          style: TextStyle(
                            fontSize: 14,
                            color: bookNowTicket,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen('عيادة التجميل والترميم')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/filler.png',
                          height: 60,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('plastic'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          color: Colors.grey,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('book-now'),
                          style: TextStyle(
                            fontSize: 14,
                            color: bookNowTicket,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen('عيادة الجراحة العامة')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/surgery.png',
                          height: 60,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('surgery'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          color: Colors.grey,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('book-now'),
                          style: TextStyle(
                            fontSize: 14,
                            color: bookNowTicket,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen('طب وجراحة العيون')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/eye.png',
                          height: 60,
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('ophthalmology'),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          color: Colors.grey,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('book-now'),
                          style: TextStyle(
                            fontSize: 16,
                            color: bookNowTicket,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
    final double categoryHeight = MediaQuery.of(context).size.height * 0.16;
    final double categoryWidth = 220.0;
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
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostScreen('أسعار فحص كورونا')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/vaccine.png',
                          width: 50,
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('test-price'),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              color: Palette.primaryColor,
                              child: Text(
                                AppLocalizations.of(context).translate('jod') +
                                    ' 25 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostScreen('زيارة طبيب للمنزل')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/hospital.png',
                          width: 50,
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('doctor-visit'),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              color: Palette.primaryColor,
                              child: Text(
                                AppLocalizations.of(context).translate('jod') +
                                    ' 30 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostScreen('زيارة تمريض للمنزل')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/delivery.png',
                          width: 50,
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('nurse-visit'),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              color: Palette.primaryColor,
                              child: Text(
                                AppLocalizations.of(context).translate('jod') +
                                    ' 15 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: categoryWidth,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10),
                height: categoryHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostScreen('معالج طبيعي')));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/massage.png',
                          width: 50,
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('natural-visit'),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              color: Palette.primaryColor,
                              child: Text(
                                AppLocalizations.of(context).translate('jod') +
                                    ' 30 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
