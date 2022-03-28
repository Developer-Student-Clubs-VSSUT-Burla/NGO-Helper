// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LogIn extends StatefulWidget {
  final VoidCallback onClickedSignedUp;

  const LogIn({
    Key? key,
    required this.onClickedSignedUp,
  }): super (key: key);


  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Login"),
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
                    controller: emailController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0)),
                      hintText: 'Email',
                    )
                )
            ),
            Container(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child:TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0)),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                )
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child:RaisedButton(onPressed: signin,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child:Text("Login",style:TextStyle(color:Colors.white,

                    fontSize: 20.0),textAlign: TextAlign.center,),
                color: Colors.teal,),
            ),
            SizedBox(height: 60.0),
            Center(
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black45,fontSize: 18.0),
                    text: 'No account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap=widget.onClickedSignedUp,
                        text: 'Sign Up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.teal,
                          fontSize: 17.0,
                        ),
                      ),
                    ]
                ),
              ),
            )
          ],
        )
    );
  }
  Future signin() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    }on FirebaseAuthException catch (e)
    {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
