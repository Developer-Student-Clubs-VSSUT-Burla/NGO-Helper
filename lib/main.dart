import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ngo_helper/screens/auth.dart';
import 'package:ngo_helper/screens/eventDetails.dart';
import 'package:ngo_helper/screens/my_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyHome());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: MainPage()

      // EventDetails(
      //   name: "Sample-Event-Name",
      //   location: "Location,State",
      //   date: "DD/MM/YY",
      //   time: "10:30:AM",
      //   ngo: "Non-Governmental Organisation",
      //   description:
      //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      //   image:
      //       "https://delhigreens.com/wp-content/uploads/2017/06/environment-day-2017.jpg",
      // ),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong !'));
            }
            if (snapshot.hasData) {
              return const MyApp();
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}
