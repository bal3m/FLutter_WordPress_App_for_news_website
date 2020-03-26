import 'package:flutter/material.dart';
import 'wakala.dart';
class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
 int currentIndex=1;
//  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
 void initState() {
   super.initState();
 }
 @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 14,
        child: Scaffold(
                      backgroundColor:   Colors.grey.shade100,
          appBar: AppBar(title: Center(child: Text('YOUR TITLE',textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'Tajawal'),)),backgroundColor: Color.fromRGBO(27,38,50,1),


          bottom: TabBar(
            indicatorColor: Colors.amber,
              isScrollable: true,
              tabs: [
                // Text('عاجل'),
                Text('مجلس النواب'),
                Text('سياسة محلية'),
                Text('سياسة دولية'),
                Text('اقتصاد '),
                Text('رياضة '),
                Text('صحة'),
                Text('تكنولوجيا'),
                Text('فنون و ثقافة'),
                Text('صحف محلية'),
                Text('صحف عربية'),
                Text('صحف دولية'),
                // Text('اقتصاد دولي'),
                Text('صور'),
                Text('كاريكاتير'),
                Text('منوعات'),
                
                
                // Text('رياضة محلية'),
                
                
                
                
//                Text('وكالة انباء المستقبل'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Wakala(id: 11,),
              Wakala(id:10 ,),
              Wakala(id: 3,),
              Wakala(id: 1,),
              Wakala(id: 4,),
              Wakala(id: 6,),
              Wakala(id: 20,),
              Wakala(id: 8,),
              Wakala(id: 7,),
              Wakala(id: 23,),
              Wakala(id: 22,),
              Wakala(id: 24,),
              // Wakala(id: 9,),
              Wakala(id: 12,),
              Wakala(id: 28,),
              Wakala(id: 26,),
              
              
              
              
              // Wakala(id: 5,),
              
//              Wakala(id: 13,),
            ],
          ),
        ),
      ),
    );

  }

}