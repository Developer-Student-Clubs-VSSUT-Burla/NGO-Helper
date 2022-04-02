import 'package:email_validator/email_validator.dart';
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
        body: Center(
          child: ListView(
              padding: const EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
              children: <Widget>[
                Container(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.teal
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                  child: TextField(
                      controller: displayNameController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Your Name',
                        fillColor: Colors.grey[280],
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal,width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )
                  ),
                ),

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
                  ),
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
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                  child: ElevatedButton(
                    onPressed: signup,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),

                    child: const Text("SignUp",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 18.0,
                        ),
                        text: 'Already have an account ? ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: 'Log In',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                decoration: TextDecoration.underline,
                                fontSize: 17.0),
                          ),
                        ]),
                  ),
                )
              ]
          ),
        )

    );
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
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
