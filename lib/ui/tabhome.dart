import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wakala/ui/home.dart';
import 'package:wakala/ui/rigester.dart';
import 'package:wakala/ui/search.dart';
import 'wakala.dart';
import 'package:wakala/ui/whome.dart';
import 'Data/posts.dart';
import 'package:html/parser.dart';
import 'widgets/slide_item.dart';
import 'viewpost.dart';
import 'viewbycat.dart';
class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
 int currentIndex=1;
//  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
 void initState() {
   super.initState();

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
//   print('FCM Token: $token');
// });
 }
 @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 12,
        child: Scaffold(
          appBar: AppBar(title: Center(child: Text('وكالة أنباء المستقبل',textDirection: TextDirection.rtl,)),backgroundColor: Color.fromRGBO(27,38,50,1),


          bottom: TabBar(
              isScrollable: true,
              tabs: [
                Text('عاجل'),
                Text('سياسي دولي'),
                Text('سياسي محلي'),
                Text('مجلس النواب'),
                Text('اقتصاد دولي'),
                Text('اقتصاد محلي'),
                Text('انفوقراف'),
                Text('تكنولوجيا'),
                Text('رياضي دولي'),
                Text('رياضي محلي'),
                Text('فنون و ثقافة'),
                Text('وكالة انباء المستقبل'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Wakala(id: 11,),
              Wakala(id: 1,),
              Wakala(id: 3,),
              Wakala(id:10 ,),
              Wakala(id: 9,),
              Wakala(id: 4,),
              Wakala(id: 12,),
              Wakala(id: 8,),
              Wakala(id: 6,),
              Wakala(id: 5,),
              Wakala(id: 7,),
              Wakala(id: 13,),
            ],
          ),
//        bottomNavigationBar: BottomNavyBar(
//        backgroundColor: Color.fromRGBO(27,38,50,1),
//        selectedIndex: currentIndex,
//        showElevation: true,
//        itemCornerRadius: 8,
//        onItemSelected: (index) => setState(() {
//          currentIndex = index;
//          switch(index) {
//              case 0: {
//                Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx)=>Whome()));
//              }
//            break;
//
//          //  case 1: {
//          //     Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>TabBarDemo()));
//          //   }
//            break;
//             case 2: {
//              Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>Search()));
//            }
//            break;
//            case 3: {
//              Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>Home()));
//            }
//            break;
//
//             default: {
//      //statements;
//             }
//           break;
//               }
//        }),
//        items: [
//          BottomNavyBarItem(
//            icon: Icon(Icons.home),
//            title: Text('الرئيسية'),
//            activeColor: Colors.white38,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.dashboard),
//            title: Text('التصنيفات'),
//            activeColor: Colors.white38,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.search),
//            title: Text('بحث'),
//            activeColor: Colors.white38,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.info),
//            title: Text('عن التطبيق'),
//            activeColor: Colors.white38,
//          ),
//        ],
//      ),
        ),
      ),
    );

  }

}