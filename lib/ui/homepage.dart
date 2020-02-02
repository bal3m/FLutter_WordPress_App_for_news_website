import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:wakala/ui/whome.dart';
import 'package:wakala/ui/home.dart';
import 'package:wakala/ui/tabhome.dart';
import 'package:wakala/ui/search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar:  AppBar(title: Center(child: Text('وكالة أنباء المستقبل',textDirection: TextDirection.rtl,)),backgroundColor: Color.fromRGBO(27,38,50,1),),

    body: SizedBox.expand(
        child: PageView(
          physics:new NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Whome(),
            TabBarDemo(),
            Search(),
            Home()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromRGBO(27,38,50,1),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('الرئيسية'),
            activeColor: Colors.white38,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('التصنيفات'),
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('بحث'),
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.info),
            title: Text('عن التطبيق'),
            activeColor: Colors.white,
          ),
        ],
      ),
    );

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
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
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
      String message =
          "هناك اصدار أحدث متوفر لهذا التطبيق";
      String btnLabel = "تحديث الآن";
      String btnLabelCancel = "لاحقا";
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
            onPressed: () => Navigator.pop(context),
          ),
        ],
      )
          : new AlertDialog(
        title: Text(title,textDirection: TextDirection.rtl,),
        content: Text(message,textDirection: TextDirection.rtl),
        actions: <Widget>[
          FlatButton(
            child: Text(btnLabel,textDirection: TextDirection.rtl),
            onPressed: () => _launchURL(PLAY_STORE_URL),
          ),
          FlatButton(
            child: Text(btnLabelCancel,textDirection: TextDirection.rtl),
            onPressed: () => Navigator.pop(context),
          ),
        ],
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