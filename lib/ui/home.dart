import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wakala/ui/rigester.dart';
import 'package:wakala/ui/search.dart';
import 'package:wakala/ui/searchResult.dart';
import 'package:wakala/ui/tabhome.dart';
import 'package:wakala/ui/whome.dart';
import "Data/data.dart";
//import 'package:url_launcher/url_launcher.dart';
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size devise_size;
  int currentIndex=3;

  int r=212;

  int g=175;

  int b=55;
  @override
  Widget build(BuildContext context) {
    devise_size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('وكالة أنباء المستقبل',textDirection: TextDirection.rtl,)),backgroundColor: Color.fromRGBO(27,38,50,1),),

      body:  ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(data[3]['image'],height: 200,width: 300,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Column(
                children: <Widget>[
                   Text(data[3]['content'],style:TextStyle(fontSize:18,),textDirection: TextDirection.rtl,textAlign: TextAlign.center, ),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
                         child: AboutListTile(

                         applicationIcon:Image.asset("images/icon.png",height: 80,width: 50,),

//      icon: FlutterLogo(
//        colors: Colors.yellow,
//      ),
                          aboutBoxChildren: <Widget>[
                          SizedBox(
                          height: 10.0,
                          ),
                          Text(
                            "طور من قبل فريق تقنية المعلومات بمؤسسة الخدمات الإعلامية بمجلس النواب",textDirection: TextDirection.rtl,
                           ),
//        Text(
//          "MTechViral",
//        ),
      ],
                           applicationName: "وكالة أنباء المستقبل",
                        applicationVersion: "1.0.2",
                     applicationLegalese: "Apache License 2.0",
    ),
                       ),
                     ),
                   ),
                  //  IconButton(
                  //       icon:Icon(Icons.launch,color: Colors.indigo,) ,
                  //       iconSize: 30,
                  //       onPressed: ()=>{
                  //         _launchURL(context,3)
                  //       }
                  //     ),
                ],
                ),
            ),
          ),

            ],
          ),

        ],
      ),
//      bottomNavigationBar: BottomNavyBar(
//        backgroundColor: Color.fromRGBO(27,38,50,1),
//        selectedIndex: currentIndex,
//        showElevation: true,
//        itemCornerRadius: 8,
//        onItemSelected: (index) => setState(() {
//          currentIndex = index;
//          switch(index) {
//              case 0: {
//
//                 Whome();
//
//              }
//            break;
//
//           case 1: {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarDemo()));
//            }
//            break;
//
//             case 2: {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
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
//            activeColor: Colors.white,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.search),
//            title: Text('بحث'),
//            activeColor: Colors.white,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.info),
//            title: Text('عن التطبيق'),
//            activeColor: Colors.white,
//          ),
//        ],
//      ),
      //  ListView(
        
      //   children: <Widget>[
      //     // Image.asset("images/12.png",height: 180, width: 500),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child:ListView.builder(
      //         primary: false,
      //           scrollDirection: Axis.vertical,
      //           shrinkWrap: true,
      //         itemCount:data == null ? 0:data.length,
      //         itemBuilder: (BuildContext context, int index){
      //           Map d=data[index];
      //           return Padding(
      //             padding: const EdgeInsets.all(0),
      //             child: InkWell(
      //               onTap: ()=>{
      //                  _showonTapMessage(context,index)
      //               },
      //               child: Card(
      //               // color: Color.fromRGBO(r,g,b, 1),
      //               child: Column(
      //                 children: <Widget>[
      //                   Padding(
      //                     padding: const EdgeInsets.all(2.0),
      //                     child: Center(child: Text(d['title'],style: TextStyle(fontSize: 18),),),
      //                   ),
      //                   Container(
      //                     child: Image.asset(d['image'],height: 100,width: 150,),
      //                   ),
                        
      //                   // Container(
      //                   //   child: Text(d["content"],style:TextStyle(fontSize:14,),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
      //                   // ),
                      

      //                 ],
      //               ),
      //             ),
      //             ) 
      //           );
      //         }
      //         ) ,
      //     )
      //   ],
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       ListTile(
      //         title: Text("قناة ليبيا المستقبل"),
      //         onTap: ()=>{
      //           Navigator.pushNamed(context, "www.google.ly")
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('هل أنت متأكد؟',textDirection: TextDirection.rtl,),
            content:Text('أنت على وشك إغلاق التطبيق!!',textDirection: TextDirection.rtl,),
            actions: <Widget>[
              FlatButton(
                child: Text('تراجع',textDirection: TextDirection.rtl,),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('تأكيد',textDirection: TextDirection.rtl,),
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
