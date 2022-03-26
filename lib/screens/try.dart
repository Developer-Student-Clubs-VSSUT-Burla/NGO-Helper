import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TRY extends StatefulWidget {
  const TRY({Key? key}) : super(key: key);

  @override
  State<TRY> createState() => _TRYState();
}

class _TRYState extends State<TRY> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar:AppBar(
        title: Text('try'),
      ),
      body: Center(
        child: Container(
          child: Text('suraj'),
        ),
      ),
    );
  }
}
