import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:wakala/ui/tabhome.dart';
import 'package:wakala/ui/whome.dart';
import 'package:wakala/ui/home.dart';
import 'login.dart';

class Rigester extends StatefulWidget{
  @override
  _RigesterState createState() => _RigesterState();
}

class _RigesterState extends State<Rigester> {
  int currentIndex=2;

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  TextEditingController _name = new TextEditingController();

  TextEditingController _phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset("images/mof.png",height: 150,width: 250,),
          Column(children: <Widget>[
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                hintText: " الاسم",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                hintText: "الهاتف",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                hintText: "البريد الإلكتروني",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                hintText: "كلمة المرور",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 30),
                  //   child: RaisedButton(
                  //     child: Text("تسجيل الدخول"),
                  //     onPressed: (){},
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Center(
                      child: RaisedButton(
                        child: Text("انشاء حساب"),
                        onPressed: (){},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],)
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromRGBO(27,38,50,1),
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          switch(index) { 
              case 0: { 
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Whome()));
              } 
            break; 
  
           case 1: {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarDemo()));
            } 
            break; 
             case 2: {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Rigester()));
            } 
            break; 
             case 3: {
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Home()));
            } 
            break;
      
             default: { 
      //statements;  
             }
           break; 
               }
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('الرئيسية'),
            activeColor: Colors.white38,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('التصنيفات'),
            activeColor: Colors.white38,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('حسابي'),
            activeColor: Colors.white38,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.info),
            title: Text('عن التطبيق'),
            activeColor: Colors.white38,
          ),
        ],
      ),
    );
  }
}