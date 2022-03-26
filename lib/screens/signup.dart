import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Signup"),
          backgroundColor: Colors.teal,
        ),
        body:ListView(
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            children:<Widget>[
              Container(
                  child: Text("Signup",style: TextStyle(fontWeight:FontWeight.bold,
                      fontSize: 40.0,color: Colors.teal),textAlign: TextAlign.center,)
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Enter Fullname',
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Enter Username',
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Your Email',
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Enter Password',
                    )
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child:RaisedButton(onPressed: (){},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child:Text("Continue",style:TextStyle(color:Colors.white,
                      fontSize: 20.0)),
                  color: Colors.teal,),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(30.0,30.0,30.0,10.0),
                  child:Text("Have Account?",
                    style: TextStyle(fontSize: 18.0,color: Colors.teal),
                    textAlign: TextAlign.center,)
              ),
              Container(
                child: TextButton.icon(
                  onPressed: (){},
                  icon:Icon(
                    Icons.login_rounded,
                    color: Colors.teal,
                  ),label: Text("Login",textAlign:TextAlign.center,
                    style:TextStyle(color: Colors.teal,fontSize: 17.0)),
                ),
              ),
            ]
        )
    );
  }
}
