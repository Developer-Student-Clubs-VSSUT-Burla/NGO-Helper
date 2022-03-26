// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Auth.dart';
import 'package:flutter_app/screens/MyAppState.dart';
import 'package:flutter_app/screens/try.dart';


void main() async  {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: MainPage(),
  )
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // navigatorKey: navigatorKey;
    return Scaffold(
      body: StreamBuilder<User?>(
          stream:FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError)
            {
              return Center(child: Text('Something went wrong !'));
            }
            if(snapshot.hasData)
            {
              return MyApp();
            }
            else
            {
              return AuthPage();
            }
          }
      ),
    );
  }
}