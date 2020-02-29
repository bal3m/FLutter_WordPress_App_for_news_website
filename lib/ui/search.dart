import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wakala/ui/searchResult.dart';
import 'package:wakala/util/colors.dart';

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
      body: Center(
        child: Text("قم بكتابة ما تريد البحث عنه لمشاهدة النتائج"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor:HexColor('#0378A6'),
        onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Result(search: _searchController.text.toString(),)))
        } ,
      ),
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