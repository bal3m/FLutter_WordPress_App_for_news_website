import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wakala/ui/Data/posts.dart';
import 'package:wakala/ui/splash.dart';
import 'package:http/http.dart'as http;
// import 'ui/login.dart';
// import 'ui/wakala.dart';
// import 'ui/tabhome.dart';
import 'ui/whome.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
void main() {
   FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };

  runApp(MyApp());
  }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
 void initState()  {
   super.initState();
   
//      OneSignal. shared .init ( "9a65791b-f885-49ad-97c8-dec2b4a0dfea");
//    OneSignal. shared .setInFocusDisplayType (OSNotificationDisplayType.none);
//    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
//       print("setNotificationReceivedHandler");

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Whome(),
//         ),
//       );
//     });
//     OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//   print("setNotificationOpenedHandler");
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Whome(),
//     ),
//   );
// });
//   firebaseMessaging.configure(
//     onMessage: (Map<String, dynamic> message) {
//       print('onMessage called: $message');
//        showDialog(
//                context: context,
//                builder: (context) => AlertDialog(
//                        content: ListTile(
//                        title: Text(message['notification']['title']),
//                        subtitle: Text(message['notification']['body']),
//                        ),
//                        actions: <Widget>[
//                        FlatButton(
//                            child: Text('Ok'),
//                            onPressed: () => Navigator.of(context).pop(),
//                        ),
//                    ],
//                ),
//            );
//
//     },
//     onResume: (Map<String, dynamic> message) {
//       print('onResume called: $message');
//     },
//     onLaunch: (Map<String, dynamic> message) {
//       print('onLaunch called: $message');
//     },
//   );
//   firebaseMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true, badge: true, alert: true));
//   firebaseMessaging.getToken().then((token){
//     dToken=token;
//   print('FCM Token: $dToken');
// });
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'وكالة أنباء المستقبل',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
