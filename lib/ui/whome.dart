import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'Data/posts.dart';
import 'package:html/parser.dart';
import 'widgets/slide_item.dart';
import 'viewpost.dart';

class Whome extends StatefulWidget {
  @override
  _WhomeState createState() => _WhomeState();
}

class _WhomeState extends State<Whome> {
  List x = new List();
  String imgurl =
      'http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png';
  @override
  void initState() {
    try {
      versionCheck(context);
    } catch (e) {
      print(e);
    }
    OneSignal.shared.init("9a65791b-f885-49ad-97c8-dec2b4a0dfea");
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {});
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    });
//
    PageController _pageController;
    super.initState();
//
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:   Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
            child: Text(
          'YOUR APP TITLE HERE',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'Tajawal'),
        )),
        backgroundColor: Color.fromRGBO(27, 38, 50, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text(
                    "مقالات مثبتة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ]),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: pinned(18),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          Map trend = snapshot.data[index];
                          String title =
                              snapshot.data[index]['title']['rendered'];
                          String image = snapshot.data[index]
                              ['jetpack_featured_media_url'];
                          String content =
                              snapshot.data[index]['content']['rendered'];
                          String img = trend['jetpack_featured_media_url'];
                          return InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPost(
                                            title: title,
                                            content: content,
                                            image: image,
                                          )))
                            },
                            child: SlideItem(
                              title:
                                  parse(trend['title']['rendered'].toString())
                                      .documentElement
                                      .text,
                              img: trend['jetpack_featured_media_url'] == ''
                                  ? imgurl
                                  : trend['jetpack_featured_media_url'],
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(212, 175, 55, 1),
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(27, 38, 50, 1)),
                    ));
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            //section 1 pinned
    Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "مجلس النواب الليبي",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                    future: majles(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            Map trend = snapshot.data[index];
                            String title =
                                snapshot.data[index]['title']['rendered'];
                            String image = snapshot.data[index]
                                ['jetpack_featured_media_url'];
                            String content =
                                snapshot.data[index]['content']['rendered'];
                            String img = trend['jetpack_featured_media_url'];

                            return InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewPost(
                                              title: title,
                                              content: content,
                                              image: image,
                                            )))
                              },
                              child: SlideItem(
                                title:
                                    parse(trend['title']['rendered'].toString())
                                        .documentElement
                                        .text,
                                img: trend['jetpack_featured_media_url'] == ''
                                    ? imgurl
                                    : trend['jetpack_featured_media_url'],
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(212, 175, 55, 1),
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(27, 38, 50, 1)),
                      ));
                    }),
              ),
            ),
            //section 2
          SizedBox(
              height: 10,
            ),
            Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "آخر الأخبار",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                    future:pinned(13),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            Map trend = snapshot.data[index];
                            String title =
                                snapshot.data[index]['title']['rendered'];
                            String image = snapshot.data[index]
                                ['jetpack_featured_media_url'];
                            String content =
                                snapshot.data[index]['content']['rendered'];
                            String img = trend['jetpack_featured_media_url'];

                            return InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewPost(
                                              title: title,
                                              content: content,
                                              image: image,
                                            )))
                              },
                              child: SlideItem(
                                title:
                                    parse(trend['title']['rendered'].toString())
                                        .documentElement
                                        .text,
                                img: trend['jetpack_featured_media_url'] == ''
                                    ? imgurl
                                    : trend['jetpack_featured_media_url'],
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(212, 175, 55, 1),
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(27, 38, 50, 1)),
                      ));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'هل أنت متأكد؟',
              textDirection: TextDirection.rtl,
            ),
            content: Text(
              'أنت على وشك إغلاق التطبيق!!',
              textDirection: TextDirection.rtl,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'تراجع',
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text(
                  'تأكيد',
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }
}

const APP_STORE_URL =
    'https://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftwareUpdate?id=YOUR-APP-ID&mt=8';
const PLAY_STORE_URL =
    'https://play.google.com/store/apps/details?id=com.msfhor.wakala';

versionCheck(context) async {
  //Get Current installed version of app
  final PackageInfo info = await PackageInfo.fromPlatform();
  double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));

  //Get Latest version info from firebase config
  final RemoteConfig remoteConfig = await RemoteConfig.instance;

  try {
    // Using default duration to force fetching from remote server.
    await remoteConfig.fetch(expiration: const Duration(seconds: 2));
    await remoteConfig.activateFetched();
    remoteConfig.getString('force_update_current_version');
    double newVersion = double.parse(remoteConfig
        .getString('force_update_current_version')
        .trim()
        .replaceAll(".", ""));
    if (newVersion > currentVersion) {
      _showVersionDialog(context);
    }
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
}

//Show Dialog to force user to update
_showVersionDialog(context) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title = " تحديث متوفر";
      String message = "هناك اصدار أحدث متوفر لهذا التطبيق";
      String btnLabel = "تحديث الآن";
      String btnLabelCancel = "خروج";
      return Platform.isIOS
          ? new CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text(btnLabel),
                  onPressed: () => _launchURL(APP_STORE_URL),
                ),
                FlatButton(
                  child: Text(btnLabelCancel),
                  onPressed: () => exit(0),
                ),
              ],
            )
          : WillPopScope(
              onWillPop: close,
              child: new AlertDialog(
                title: Text(
                  title,
                  textDirection: TextDirection.rtl,
                ),
                content: Text(message, textDirection: TextDirection.rtl),
                actions: <Widget>[
                  FlatButton(
                    child: Text(btnLabel, textDirection: TextDirection.rtl),
                    onPressed: () => _launchURL(PLAY_STORE_URL),
                  ),
                  FlatButton(
                    child:
                        Text(btnLabelCancel, textDirection: TextDirection.rtl),
                    onPressed: () => exit(0),
                  ),
                ],
              ),
            );
    },
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<bool> close() {
  exit(0);
}
