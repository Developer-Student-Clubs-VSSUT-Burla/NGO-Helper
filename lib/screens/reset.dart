// ignore_for_file: deprecated_member_use

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

class ResetB extends StatefulWidget {

  @override
  State<ResetB> createState() => _ResetBState();
}

class _ResetBState extends State<ResetB> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(

          padding: const EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
          children: <Widget>[
            const Text("Forgot Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.teal),
                textAlign: TextAlign.center),
            SizedBox(height: 60),
            Container(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                child: TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Email',
                    fillColor: Colors.grey[280],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal,width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email)=>
                  email != null && EmailValidator.validate(email)
                      ? null
                      : 'Enter a valid email',
                )
            ),
            Container(
              height: 50.0,
              margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                  Navigator.of(context).pop();
                  showToast();
                },
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        )
    );
  }
}


void showToast()=>Fluttertoast.showToast(
    msg: 'Reset email sent',
    fontSize: 15.0,
    gravity: ToastGravity.BOTTOM,
);
