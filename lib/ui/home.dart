import 'dart:io';
import 'package:flutter/material.dart';
import "Data/data.dart";

//import 'package:url_launcher/url_launcher.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size devise_size;
  int currentIndex = 3;

  int r = 212;

  int g = 175;

  int b = 55;
  @override
  Widget build(BuildContext context) {
    devise_size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
            backgroundColor:   Colors.grey.shade100,

      appBar: AppBar(
        title: Center(
            child: Text(
          'وكالة أنباء المستقبل',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'Tajawal'),
        )),
        backgroundColor: Color.fromRGBO(27, 38, 50, 1),
      ),

      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                data[3]['image'],
                height: 200,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      Text(
                        data[3]['content'],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
                            child: AboutListTile(
                              applicationIcon: Image.asset(
                                "images/icon.png",
                                height: 80,
                                width: 50,
                              ),
                              aboutBoxChildren: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  " طور من قبل فريق تقنية المعلومات بمؤسسة الخدمات الإعلامية بمجلس النواب الليبي",
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                              applicationName: "وكالة أنباء المستقبل",
                              applicationVersion: "1.0.6",
//                     applicationLegalese: "Apache License 2.0",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
////////////////////////////////////////////////////////////

//void _showonTapMessage(BuildContext context, int i) {
//  Map c =data[i];
//    var alert = new AlertDialog(
//      title: Text(c['title'],style:TextStyle(fontSize:24,),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
//      // title: Text(
//      //   "${menu.title}",
//      //   textDirection: TextDirection.rtl,
//      //   textAlign: TextAlign.center,
//      //   style: TextStyle(
//      //       fontWeight: FontWeight.bold,
//      //       fontSize: 45,
//      //       fontFamily: "Scheherazade"),
//      // ),
//      // titlePadding:
//      content: ListView(
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              Image.asset(c['image'],height: 100,width: 200,),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Container(
//        height: devise_size.height+250,
//        width: devise_size.width,
//        child: Padding(
//            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
//            child: Column(
//            children: <Widget>[
//               Text(c['content'],style:TextStyle(fontSize:18,),textDirection: TextDirection.rtl,textAlign: TextAlign.center, ),
//               IconButton(
//                    icon:Icon(Icons.launch,color: Colors.indigo,) ,
//                    iconSize: 30,
//                    onPressed: ()=>{
//                      _launchURL(context,i)
//                    }
//
//
//                  ),
//            ],
//            ),
//        ),
//    ),
//          ),
//
//            ],
//          ),
//
//        ],
//      )
//    );
//    // showDialog(context: context, child: alert);
//    showDialog(context: context, builder: (context) => alert);
//  }

//    _launchURL(BuildContext context, i) async {
//     Map link =data[i];
//  var url = link['link'];
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
//}
}
