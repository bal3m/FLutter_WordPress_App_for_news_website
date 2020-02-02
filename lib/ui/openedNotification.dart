import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:wakala/ui/Data/posts.dart';
import 'package:wakala/ui/widgets/slide_item.dart';
class OpenedNotification extends StatefulWidget{
  final String title;

  const OpenedNotification({Key key, this.title}) : super(key: key);
  @override
  _OpenedNotificationState createState() => _OpenedNotificationState();
}

class _OpenedNotificationState extends State<OpenedNotification> {
  String imgurl='http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('تفاصيل الخبر',textDirection: TextDirection.rtl,)),
        backgroundColor: Color.fromRGBO(27,38,50,1),
      ),
      body: Container(
        child: FutureBuilder(
            future:fetchByNotification(widget.title),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:1,
                  itemBuilder: (BuildContext context ,int index){
                    Map trend =snapshot.data[index];
                    String title= snapshot.data[index]['title']['rendered'];
                    String image= snapshot.data[index]['jetpack_featured_media_url'];
                    String content=snapshot.data[index]['content']['rendered'];
                    String img=trend['jetpack_featured_media_url'];

                    return ListView(
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
    );
  }
}