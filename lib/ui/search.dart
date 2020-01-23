import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wakala/ui/rigester.dart';
import 'package:wakala/ui/searchResult.dart';
import 'package:wakala/ui/tabhome.dart';
import 'package:wakala/ui/whome.dart';
import 'package:wakala/util/colors.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String serach;
  TextEditingController _searchController=new TextEditingController();
  int currentIndex=2;
//   FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
 void initState() {
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
          child: Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "..بحث",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  // suffixIcon: Icon(
                  //   Icons.filter_list,
                  //   color: Colors.black,
                  // ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _searchController,
              ),
            ),
          ),
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          60.0,
        ),
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
          child: Text("قم بكتابة ما تريد البحث عنه لمشاهدة النتائج"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor:HexColor('#0378A6'),
        onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Result(search: _searchController.text.toString(),)))
        } ,
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
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>Whome()));
//              }
//            break;
//
//           case 1: {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarDemo()));
//            }
//            break;
//
//            //  case 2: {
//            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
//            // }
//            // break;
//            case 3: {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//            }
//            break;
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
}



//  return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(title: Center(child: Text('وكالة أنباء المستقبل',textDirection: TextDirection.rtl,)),backgroundColor: Color.fromRGBO(27,38,50,1),),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
//         child:Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: FutureBuilder(
//           future:fetchFromApi(),
//           builder: (context,snapshot){
//         if(snapshot.hasData){
//           return ListView.builder(
//             scrollDirection: Axis.vertical,
//            itemCount:10,
//             itemBuilder: (BuildContext context ,int index){
//               Map trend =snapshot.data[index];
//               String title= snapshot.data[index]['title']['rendered'];
//               String image= snapshot.data[index]['jetpack_featured_media_url'];
//               String content=snapshot.data[index]['content']['rendered'];
//               return InkWell(
//                 onTap: ()=>{
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPost(title: title,content: content,image: image,)))
//                 },
//                 child:  SlideItem(
//                 title: parse(trend['title']['rendered'].toString()).documentElement.text,
//                 img: trend['jetpack_featured_media_url'],
//               ),
//               );
//             },
//           );
//         }
//         return Center(child: CircularProgressIndicator(
//           backgroundColor: Color.fromRGBO(212, 175, 55, 1),
//           valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(27,38,50,1)),
//         ));
//           }
//         ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavyBar(
//         backgroundColor: Color.fromRGBO(27,38,50,1),
//         selectedIndex: currentIndex,
//         showElevation: true,
//         itemCornerRadius: 8,
//         onItemSelected: (index) => setState(() {
//           currentIndex = index;
//           switch(index) { 
//               case 0: { 
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Whome()));
//               } 
//             break; 
  
//            case 1: {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarDemo()));
//             } 
//             break; 
            
//              case 2: {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>Rigester()));
//             } 
//             break; 
//             case 3: {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//             } 
//             break;
//              default: { 
//       //statements;  
//              }
//            break; 
//                }
//         }),
//         items: [
//           BottomNavyBarItem(
//             icon: Icon(Icons.home),
//             title: Text('الرئيسية'),
//             activeColor: Colors.white38,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.dashboard),
//             title: Text('التصنيفات'),
//             activeColor: Colors.white,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.people),
//             title: Text('حسابي'),
//             activeColor: Colors.white,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.info),
//             title: Text('عن التطبيق'),
//             activeColor: Colors.white,
//           ),
//         ],
//       ),
//     );