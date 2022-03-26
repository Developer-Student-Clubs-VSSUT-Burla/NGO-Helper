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
          title:Text("Login/Signup"),
          backgroundColor: Colors.teal,
        ),
        body:ListView(
          padding: EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
          children: <Widget>[
            Container(
                child: Text("Login",style: TextStyle(fontWeight:FontWeight.bold,
                    fontSize: 40.0,color: Colors.teal),textAlign:TextAlign.center)
            ),
            Container(
                padding: EdgeInsets.all(30.0),
                child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Username',
                    )
                )),
            Container(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Pasword',
                    )
                )),
            Container(
              height: 50.0,
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child:RaisedButton(onPressed: (){},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child:Text("Login",style:TextStyle(color:Colors.white,

                    fontSize: 20.0),textAlign: TextAlign.center,),
                color: Colors.teal,),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child:Text("New User?",style: TextStyle(fontSize: 17.0,color: Colors.teal),
                  textAlign: TextAlign.center,)
            ),
            Container(
              child: TextButton.icon(
                onPressed: (){},
                icon:Icon(
                  Icons.add_box_sharp,
                  color: Colors.teal,
                ),label: Text("Create Account",textAlign:TextAlign.center,
                  style:TextStyle(color: Colors.teal,fontSize: 17.0)),
              ),
            ),
          ],
        )
    );
  }
}
