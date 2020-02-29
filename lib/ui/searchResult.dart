import 'package:flutter/material.dart';
import 'package:wakala/ui/viewpost.dart';
import 'package:wakala/ui/widgets/slide_item.dart';
import 'Data/posts.dart';
import 'package:html/parser.dart';

 class Result extends StatefulWidget {
   final String search;
   
  const Result({Key key, this.search}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
   Widget BuildListView(BuildContext cntx, AsyncSnapshot snapshot){
    return ListView.builder(
       scrollDirection: Axis.vertical,
       itemCount:find.length,
       itemBuilder: (BuildContext cntx ,int index){
         Map trend =snapshot.data[index];
         String title= snapshot.data[index]['title']['rendered'];
         String image= snapshot.data[index]['jetpack_featured_media_url'];
         String content=snapshot.data[index]['content']['rendered'];
         if(snapshot.data==[]){
           return Center(
             child: Text('لا توجد نتائج لعملية البحث',style: TextStyle(color: Colors.black),),
           );
         }else{
           return InkWell(
             onTap: ()=>{
               Navigator.push(cntx, MaterialPageRoute(builder: (cntx)=> ViewPost(title: title,content: content,image: image,)))
             },
             child:  SlideItem(
               title: parse(trend['title']['rendered'].toString()).documentElement.text,
               img: trend['jetpack_featured_media_url']==''?imgurl:trend['jetpack_featured_media_url'],
             ),
           );
         }

       },
     );

   }
   Widget SearchResault(BuildContext cntx){
     return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Center(child: Icon(Icons.search,size: 100,)),

             Text('لا توجد أي نتائج',style: TextStyle(fontSize: 25),),
         ],
       ),
     );
   }
  List find =new List();
  int currentIndex=2;
  String imgurl='http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png';
  Future <void> getLenght()async{
    Future.delayed(const Duration(seconds: 5));
    find=await search(widget.search);
    print(find.length);
  }

//   FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
 void initState(){
   super.initState();
   getLenght();
 }
  @override
  Widget build(BuildContext cntx) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('  بحث',textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'Tajawal'),)),backgroundColor: Color.fromRGBO(27,38,50,1),),

      body:
      Padding(
        padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child:Container(
          height: MediaQuery.of(cntx).size.height,
          width: MediaQuery.of(cntx).size.width,
          child: FutureBuilder(
          future:search(widget.search) ,
          builder: (cntx,snapshot){
        if(find.length!=0&&snapshot.hasData){
          print(snapshot.hasData);
          return BuildListView(cntx, snapshot);
        }else if(snapshot.hasData&&find.length==0){
          return SearchResault(cntx);
        }
        return Center(child: CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(212, 175, 55, 1),
          valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(27,38,50,1)),
        ));
          }
        ),
        ),
      ),
//       bottomNavigationBar: BottomNavyBar(
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
//             case 2: {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
//            }
//            break;
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
}