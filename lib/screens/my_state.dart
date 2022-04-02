// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_helper/screens/eventList.dart';
import 'package:ngo_helper/screens/profilepage.dart';
import 'package:ngo_helper/screens/screens/chat_home.dart';
import 'ngolist.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/chat': (context) => const Home(),
      },
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Ngo app'),
        // ),
        body: Container(
          color: const Color(0xffffffff),
          width: double.infinity,
          height: double.infinity,
          padding:
              const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.airplay),
                    color: Colors.teal,
                  ),
                  const Text(
                    'Hy, Buddy',
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        Icons.search_outlined,
                        color: Colors.teal,
                        size: 30,
                      )
                  ),
                  Container(
                    child: Text('Sign Out',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
              const JoinCard(),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.teal,
                tabs: [
                  const Tab(
                    icon: Icon(Icons.home_filled),
                    child: Text('Home'),
                  ),
                  const Tab(
                    icon: Icon(Icons.flag),
                    child: Text('Events'),
                  ),
                  const Tab(
                    icon: Icon(Icons.album_outlined),
                    child: Text('NGOs'),
                  ),
                  const Tab(
                    icon: Icon(Icons.person),
                    child: Text('Profile'),
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const NgoList(Colors.white, "Nearby NGOs"),
                    const EventList(Colors.white, "Upcoming Events"),
                    const NgoList(Colors.white, "Your NGOs"),
                    const ProfilePage(),
                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}

class JoinCard extends StatelessWidget {
  const JoinCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 155,
      child: Column(
        children: [
          const Text(
            'Want to contribute? ',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Join your nearest NGO ',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          RaisedButton(
            onPressed: onPressed,
            color: Colors.white,
            textColor: Colors.blue,
            child: const Text('Join Now'),
          )
        ],
      ),
    );
  }

  void onPressed() {}
}
