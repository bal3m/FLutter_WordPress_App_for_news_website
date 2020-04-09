import 'package:flutter/material.dart';
import 'package:wakala/ui/Data/data.dart';
import 'package:wakala/ui/viewpost.dart';
import 'package:wakala/ui/widgets/slide_item.dart';
import 'Data/posts.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'widgets/articleBox.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/loading.dart';

class Wakala extends StatefulWidget {
  final int id;
  final String category_name;

  const Wakala({Key key, this.id,this.category_name}) : super(key: key);

  @override
  _WakalaState createState() => _WakalaState();
}

class _WakalaState extends State<Wakala> {
  String imgurl =
      'http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png';
  List postsLenght = new List();

  Future<void> getLenght() async {
    postsLenght = await fetchByCat(widget.id);
  }
  @override
  void initState() {
    super.initState();
    this.getLenght();
  }

  @override
  Widget build(BuildContext cntx) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:   Colors.grey.shade100,
      appBar: AppBar(title: Center(child: Text('${widget.category_name}', style: TextStyle(fontFamily: 'Tajawal'),)),backgroundColor: Color.fromRGBO(27,38,50,1)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Container(
          height: MediaQuery.of(cntx).size.height,
          width: MediaQuery.of(cntx).size.width,
          child: FutureBuilder(
              future: fetchByCat(widget.id),
              builder: (cntx, snapshot) {
                if (snapshot.hasData) {
                  print(postsLenght.length);
                  print('size=${ MediaQuery.of(context).size.height/4}');
                  print('size=${ MediaQuery.of(context).size.width}');
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                         postsLenght.length== 0 ? 12 : postsLenght.length,
                    itemBuilder: (BuildContext cntx, int index) {
                      Map trend = snapshot.data[index];
                      String title = snapshot.data[index]['title']['rendered'];
                      String image =
                          snapshot.data[index]['jetpack_featured_media_url'];
                      String content =
                          snapshot.data[index]['content']['rendered'];
                       String date = DateFormat('dd MMMM, yyyy', 'en_US')
                       .format(DateTime.parse(trend["date"]))
                       .toString();
                       String category= trend['custom']['categories'][0]['name'];
                      return InkWell(
                        onTap: () => {
                          Navigator.push(
                              cntx,
                              MaterialPageRoute(
                                  builder: (cntx) => ViewPost(
                                        title: title,
                                        content: content,
                                        image: image,
                                      )))
                        },
                        child: ArticleBox(
                          title: parse(trend['title']['rendered'].toString())
                              .documentElement
                              .text,
                          img: trend['jetpack_featured_media_url'] == ''
                              ? imgurl
                              : trend['jetpack_featured_media_url'],
                            date: date,
                            category: category,
                        ),
                      );
                    },
                  );
                }
                return Container(
            alignment: Alignment.center,
            child: Loading(
                indicator: BallBeatIndicator(),
                size: 60.0,
                color: Theme.of(context).accentColor));
              }),
        ),
      ),
    );
  }
}
