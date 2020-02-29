import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:wakala/ui/homepage.dart';
import 'package:wakala/util/colors.dart';
class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "مرحبا",
        description: "مرحبا بكم في تطبيق وكالة أنباء المستقبل",
        pathImage: "images/icon.png",
        backgroundColor:HexColor('#011640'),
      ),
    );
    slides.add(
      new Slide(
        title: "الرئيسية",
        description: "في هذه الواجة يمكنك رؤية اخر الأخبار التي تم نشرها في وكالة الأنباء",
        pathImage: "images/home.png",
        backgroundColor: HexColor('#1B2740'),
      ),
    );
    slides.add(
      new Slide(
        title: "التصنيفات",
        description:
        "يمكنك في هذه الواجهة تصفح الأخبار وفقا لتصنيف معين حسب اختيارك",
        pathImage: "images/cat.png",
        backgroundColor: HexColor('#3F6ABF'),
      ),
    );
    slides.add(
      new Slide(
        title: "البحث",
        description:
        " من خلال هذه الخاصية يمكنك البحث على الخبر الذي تريد مشاهدته بشكل أسرع",
        pathImage: "images/search.png",
        backgroundColor: HexColor('#2C5DBF'),
      ),
    );
    slides.add(
      new Slide(
        title: "حقوق النشر",
        description:
        "هذا التطبيق يتبع لمؤسسة الخدمات الإعلامية بمجلس النواب الليبي",
        pathImage: "images/mof.png",
        backgroundColor: HexColor('#011640'),
      ),
    );
    slides.add(
      new Slide(
        title: "ابدأ",
        description:
        "كل شي على مايرام،قم بالتجربة اللآن",
        pathImage: "images/start.png",
        backgroundColor: HexColor('#2C5DBF'),
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}