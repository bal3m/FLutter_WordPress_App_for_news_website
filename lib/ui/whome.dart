import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wakala/ui/rigester.dart';
import 'package:wakala/ui/search.dart';
import 'package:wakala/ui/tabhome.dart';
import 'home.dart';
import 'wakala.dart';
import 'Data/posts.dart';
import 'package:html/parser.dart';
import 'widgets/slide_item.dart';
import 'viewpost.dart';
import 'viewbycat.dart';
class Whome extends StatefulWidget {
  @override
  _WhomeState createState() => _WhomeState();
}

class _WhomeState extends State<Whome> {
  int currentIndex=0;
  String imgurl='http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png';
//   FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
 void initState() {
   super.initState();
//    OneSignal. shared .init ( "9a65791b-f885-49ad-97c8-dec2b4a0dfea");
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
//   print('FCM Token: $token');
// });
 }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Center(child: Text('وكالة أنباء المستقبل',textDirection: TextDirection.rtl,)),backgroundColor: Color.fromRGBO(27,38,50,1),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
          future:fetchFromApi(),
          builder: (context,snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            scrollDirection: Axis.vertical,
           itemCount:10,
            itemBuilder: (BuildContext context ,int index){
              Map trend =snapshot.data[index];
              String title= snapshot.data[index]['title']['rendered'];
              String image= snapshot.data[index]['jetpack_featured_media_url'];
              String content=snapshot.data[index]['content']['rendered'];
              String img=trend['jetpack_featured_media_url'];

              return InkWell(
                onTap: ()=>{
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPost(title: title,content: content,image: image,)))
                },
                child:  SlideItem(
                title: parse(trend['title']['rendered'].toString()).documentElement.text,
                img: trend['jetpack_featured_media_url']==''?imgurl:trend['jetpack_featured_media_url'],
              ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(212, 175, 55, 1),
          valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(27,38,50,1)),
        ));
          }
        ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromRGBO(27,38,50,1),
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          switch(index) { 
              case 0: { 
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Whome()));
              } 
            break; 
  
           case 1: {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarDemo()));
            }
            break;

             case 2: {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
            } 
            break; 
            case 3: {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            } 
            break;
             default: { 
      //statements;  
             }
           break; 
               }
        }),
        items: [
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