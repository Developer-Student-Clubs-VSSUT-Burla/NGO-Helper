import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const SignUp({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title:Text("Signup"),
        //   backgroundColor: Colors.teal,
        // ),
        body: ListView(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            children: <Widget>[
          const Text(
            "Signup",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.teal),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: TextField(
                controller: displayNameController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Your Name',
                )),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Your Email',
                )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: TextField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Enter Password',
                ),
                obscureText: true),
          ),
          Container(
            height: 50.0,
            margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
            child: ElevatedButton(
              onPressed: signup,
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text("Continue",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
          const SizedBox(height: 60.0),
          Center(
            child: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18.0,
                  ),
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Log In',
                      style: const TextStyle(
                          //decoration: TextDecoration.underline,
                          color: Colors.teal,
                          fontSize: 17.0),
                    ),
                  ]),
            ),
          )
        ]));
  }

  Future signup() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      // update display name
      var user = FirebaseAuth.instance.currentUser!;
      // print(user);
      user.updateDisplayName(displayNameController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
