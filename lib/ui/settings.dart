import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'Data/data.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notification = false;

  @override
  void initState() {
    super.initState();
    checkNotificationSetting();
  }

  checkNotificationSetting() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'notification';
    final value = prefs.getInt(key) ?? 0;
    if (value == 0) {
      setState(() {
        _notification = false;
      });
    } else {
      setState(() {
        _notification = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'عن التطبيق',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Tajawal'),
        ),
        elevation: 5,
        backgroundColor: Color.fromRGBO(27,38,50,1),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Image(
                  image: AssetImage('images/Wka.png'),
                  height: 90,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  "Version 1.0.7 \n ${data[3]['content']} \n \n طور من قبل فريق تقنية المعلومات بمؤسسة الخدمات الإعلامية بمجلس النواب الليبي ",
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.6, color: Colors.black87),
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
              ),
              Directionality(textDirection: TextDirection.rtl, 
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(
                      "images/more/contact.png",
                      width: 30,
                    ),
                    title: Text('تواصل معنا'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                     FlatButton(
                         padding: EdgeInsets.all(0),
                         onPressed: () async {
                           const url = 'mailto:it@msf-hor.org';
                           if (await canLaunch(url)) {
                             await launch(url);
                           } else {
                             throw 'Could not launch $url';
                           }
                         },
                         child: Text( 
                           "it@msf-hor.org",
                           textDirection: TextDirection.rtl,
                           style: TextStyle(color: Colors.black54),
                         )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.msfhor.wakala :قم بتحميل تطبيق وكالة أنباء المستقبل');
                    },
                    child: ListTile(
                      
                      leading: Image.asset(
                        "images/more/share.png",
                        width: 30,
                        alignment: Alignment.centerRight,
                      ),
                      title: Text('مشاركة',
                      textDirection: TextDirection.rtl,),
                    ),
                  ),
                ],
              )
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
