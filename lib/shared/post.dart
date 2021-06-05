import 'package:eldoctor/config/palette.dart';
import 'package:eldoctor/config/styles.dart';
import 'package:eldoctor/screens/bottom_nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class PostScreen extends StatefulWidget {
  //Ask for booking type
  final String _postTitle;
  PostScreen(this._postTitle, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PostScreenState();
  }
}

class PostScreenState extends State<PostScreen> {
  Text _postText;
  Text _postTitle;
  String _imagePath;

  Text _coronaTestTitle = Text(
    'أسعار فحص كورونا',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    textDirection: TextDirection.rtl,
  );
  Text _coronaTestText = Text(
    '\n'
    'يعتمد سعر فحص فايروس كورونا على سرعة ودقة الجهاز المستخدم في فحص العينة'
    '\n\n'
    'الفحص العادي بدون نسبة الفايروس 35 د - نتيجة خلال 24 ساعة'
    '\n'
    'الفحص العادي مع نسبة الفايروس 40 د - نتيجة خلال 24 ساعة'
    '\n'
    'الفحص المتوسط مع نسبة الفايروس 50 د - نتيجة نفس اليوم مساءًا'
    '\n'
    'الفحص السريع مع نسبة الفايروس 75 د - نتيجة خلال 3-4 ساعات'
    '\n'
    'الفحص السريع مع نسبة الفايروس 75 د - نتيجة خلال 3-4 ساعات'
    '\n\n',
    textDirection: TextDirection.rtl,
  );
  String testImagePath = "assets/images/post-corona.jpg";

  Text _doctorVisitTitle = Text(
    'أسعار الزيارات',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    textDirection: TextDirection.rtl,
  );
  Text _doctorVisitText = Text(
    '\n'
    'زياردة طبيب طواريء منزلية 20 دينار'
    '\n'
    'زيارة طبيب طواريء لمريض كورونا 30 دينار'
    '\n'
    'زيارة طبيب اختصاص منزلية 40 دينار'
    '\n'
    'زيارة طبيب اختصاص لمريض كورونا 50 دينار'
    '\n'
    'زياردة ممرض منزلية 10 دينار'
    '\n'
    'زيارة ممرض منزلية لمريض كورونا 20-30 دينار'
    '\n'
    'جلسة علاج طبيعي منزلية 25 دينار'
    '\n'
    'خدمة سحب عينات الدم من المنزل (المختبر) مجانية'
    '\n'
    'خدمة التصوير بالأشعة السينية بالمنزل 50 دينار'
    '\n'
    'خدمة تصوير الجنين ومتابعة المرأة الحامل - ألتراساوند 50 دينار'
    '\n'
    'خدمة إعطاء المطاعيم الموسمية للكبار أو الأطفال مجانية'
    '\n\n',
    textDirection: TextDirection.rtl,
  );
  String doctorImagePath = "assets/images/doctor-visit.jpg";

  Text _nurseVisitTitle = Text(
    'أسعار زيارة ممرض بالمنزل',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    textDirection: TextDirection.rtl,
  );
  Text _nurseVisitText = Text(
    '\n'
    'زياردة ممرض منزلية 10 دينار'
    '\n'
    'زيارة ممرض منزلية لمريض كورونا 20-30 دينار'
    '\n'
    'خدمة إعطاء المطاعيم الموسمية للكبار أو الأطفال مجانية'
    '\n\n',
    textDirection: TextDirection.rtl,
  );

  Text _naturalTherapyTitle = Text(
    'معالج طبيعي',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    textDirection: TextDirection.rtl,
  );
  Text _naturalTherapyText = Text(
    '\n'
    'جلسة علاج طبيعي منزلية 25 دينار'
    '\n\n',
    textDirection: TextDirection.rtl,
  );

  @override
  Widget build(BuildContext context) {
    if (widget._postTitle == 'أسعار فحص كورونا') {
      _postTitle = _coronaTestTitle;
      _postText = _coronaTestText;
      _imagePath = testImagePath;
    } else if (widget._postTitle == 'زيارة طبيب للمنزل') {
      _postTitle = _doctorVisitTitle;
      _postText = _doctorVisitText;
      _imagePath = doctorImagePath;
    } else if (widget._postTitle == 'زيارة تمريض للمنزل') {
      _postTitle = _nurseVisitTitle;
      _postText = _nurseVisitText;
      _imagePath = doctorImagePath;
    } else if (widget._postTitle == 'معالج طبيعي') {
      _postTitle = _naturalTherapyTitle;
      _postText = _naturalTherapyText;
      _imagePath = doctorImagePath;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.primaryColor,
          title: Text(
            'أسعارنا',
            style: TextStyle(
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              _postTitle,
              SizedBox(height: 20),
              Image.asset(
                "$_imagePath",
                // height: 80,
              ),
              SizedBox(height: 20),
              _postText,
              FlatButton.icon(
                  onPressed: () {
                    UrlLauncher.launch('tel:+962797543452');
                  },
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  color: Palette.primaryColor,
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
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
