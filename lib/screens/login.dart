

// ignore_for_file: deprecated_member_use

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ngo_helper/screens/reset.dart';
import '../main.dart';

class LogIn extends StatefulWidget {
  final VoidCallback onClickedSignedUp;

  const LogIn({
    Key? key,
    required this.onClickedSignedUp,
  }) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(

          padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
          children: <Widget>[
            const Text("Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.teal),
                textAlign: TextAlign.center),
            SizedBox(height: 40),
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
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                    fillColor: Colors.grey[280],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal,width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)=>
                  value != null && value.length<6
                      ? 'Enter minimum 6 characters'
                      : null,
                )
            ),
            SizedBox(height: 40),
            Container(
              height: 50.0,
              margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: RaisedButton(
                onPressed: signin,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ResetB())),
                    child:Text('Forgot Password',
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 70.0),
            Center(
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black45, fontSize: 18.0),
                    text: 'No account ? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignedUp,
                        text: 'Sign Up',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.teal,
                          fontSize: 17.0,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        )
    );
  }

  Future signin() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
