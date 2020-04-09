import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:html/parser.dart';
class ArticleBox extends StatelessWidget{
 final String title; 
  final String img;
  final String date;
  final String category;

  const ArticleBox({Key key, this.title, this.img, this.date, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ConstrainedBox(
    constraints: new BoxConstraints(
      minHeight: 160.0,
      maxHeight: 175.0,
    ),
    child: Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.fromLTRB(20, 16, 8, 0),
          child: Card(
            elevation: 6,
            child: Padding(
              padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
              child: Column(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 4, 8),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Container(
                         child: AutoSizeText(parse('$title'.toString()).documentElement.text,
                         maxLines: 2,
                         textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                         maxFontSize: 20,),
                        ),
                        SizedBox(height:10),
                        Container(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFE3E3E3),
                                    borderRadius: BorderRadius.circular(3)),
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Text(
                                  '$category',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.timer,
                                      color: Colors.black45,
                                      size: 12.0,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                     '$date',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 170,
          width: 145,
          child: Card(
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            margin: EdgeInsets.all(10),
          ),
        ),
        // article.video != ""
        //     ? Positioned(
        //         left: 12,
        //         top: 12,
        //         child: Card(
        //           color: Theme.of(context).accentColor,
        //           child: CircleAvatar(
        //             radius: 14,
        //             backgroundColor: Colors.transparent,
        //             child: Image.asset("assets/play-button.png"),
        //           ),
        //           elevation: 8,
        //           shape: CircleBorder(),
        //           clipBehavior: Clip.antiAlias,
        //         ),
        //       )
        //     : Container(),
      ],
    ),
  );
  }
}

