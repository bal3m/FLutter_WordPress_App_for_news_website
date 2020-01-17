import "package:flutter/material.dart";
import 'home.dart';
import 'rigester.dart';
class Login extends StatelessWidget{
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("images/mof.png",height: 150,width: 250,),
          ),
          Column(children: <Widget>[
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
                  Padding(
                    padding: const EdgeInsets.only(left: 115),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                        },
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
            Center(
              child: FlatButton(
                child: Text("اذ ا كنت لا تمتلك حساب اضغط هنا",style: TextStyle(color: Colors.indigo),),
                onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Rigester()))
                },
              ),
            )
          ],)
        ],
      ),
    );
  }
  
}