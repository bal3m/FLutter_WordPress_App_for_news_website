import 'package:flutter/cupertino.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';
import 'package:wakala/ui/splash.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
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

   OneSignal.shared.init(
  "9a65791b-f885-49ad-97c8-dec2b4a0dfea",
  iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: true,
  }
);
OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
   OneSignal. shared .setInFocusDisplayType (OSNotificationDisplayType.none);
   OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
   });
    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
});
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
      title: 'YOUR APP TITLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

