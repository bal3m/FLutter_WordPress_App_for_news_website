import 'package:flutter/material.dart';
import 'package:wakala/ui/viewpost.dart';
import 'Data/posts.dart';
import 'package:html/parser.dart';
 class Category extends StatelessWidget {
     final String title;
     final Map data;

  const Category({Key key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title,textDirection: TextDirection.rtl,)),
        backgroundColor: Color.fromRGBO(27,38,50,1),
      ),
      body: Container(
        child: FutureBuilder(
          future:fetchByCat(data['id']) ,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
               itemCount:idCat.length,
                itemBuilder: (BuildContext context ,int index){
                  Map wpPost =snapshot.data[index];
                  String title= snapshot.data[index]['title']['rendered'];
                  String image= snapshot.data[index]['jetpack_featured_media_url'];
                  String content=snapshot.data[index]['content']['rendered'];
                 
                  return InkWell(
                    onTap: (){
                      // _showonTapMessage(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPost(title: title,content: content,image: image,)));
                    },
                    child: Card(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'images/progress.gif',
                            image: wpPost['jetpack_featured_media_url'],
                            height: 200,
                            width: 350,
                          )
                        ),
                        Center(
                          child: Text(parse(wpPost['title']['rendered'].toString()).documentElement.text,textDirection: TextDirection.rtl),
                        )
                      ],
                    ),
                  ) ,
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
  // Widget getPost(){
  //   return FutureBuilder(
  //     future: fetchFromApi(),
  //     builder: (context,snapshot){
  //       if(snapshot.hasData){
  //             return ListView.builder(
  //              itemCount:10,
  //               itemBuilder: (BuildContext context ,int index){
  //                 Map content =snapshot.data[index];

  //                 return Text(parse(content['content']['rendered'].toString()).documentElement.text);
  //               },
  //             );
  //           }
  //           return CircularProgressIndicator();
  //     }
  //   );
  // }
  // void _showonTapMessage(BuildContext context) {
  //   var alert = new AlertDialog(
  //     // title: Text(c['title'],style:TextStyle(fontSize:24,),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
  //     // title: Text(
  //     //   "${menu.title}",
  //     //   textDirection: TextDirection.rtl,
  //     //   textAlign: TextAlign.center,
  //     //   style: TextStyle(
  //     //       fontWeight: FontWeight.bold,
  //     //       fontSize: 45,
  //     //       fontFamily: "Scheherazade"),
  //     // ),
  //     // titlePadding: 
  //     content: getPost(),
  //   );
  //   // showDialog(context: context, child: alert);
  //   showDialog(context: context, builder: (context) => alert);
  // }
   
 }