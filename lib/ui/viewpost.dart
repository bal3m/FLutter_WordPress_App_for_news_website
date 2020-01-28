import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wakala/ui/Data/posts.dart';
import 'wakala.dart';
import 'package:html/parser.dart';
class ViewPost extends StatelessWidget{
  
  final String image;
  final String title;
  final String content;


  const ViewPost({Key key, this.title,this.content,this.image}) : super(key: key);
  @override
  Widget build(BuildContext cntx) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('تفاصيل الخبر',textDirection: TextDirection.rtl,)),
         backgroundColor: Color.fromRGBO(27,38,50,1),
      ),
      body: Container(
        child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/progress.gif',
                      image: image==''?'http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png':image,
                      height: 200,
                      width: 350,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(parse(title.toString()).documentElement.text,textDirection: TextDirection.rtl,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20 ),textAlign: TextAlign.center,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(parse(content.toString()).documentElement.text,textDirection: TextDirection.rtl,textAlign: TextAlign.justify,style: TextStyle(fontSize: 16,),),
                  ),
                ],
              ),
        ),
    );
  }

}