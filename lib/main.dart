// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/ngolist.dart';
import 'screens/profilepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Ngo app'),
        // ),
        body: Container(
          color: Color(0xffffffff),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.airplay),
                    color: Colors.teal,
                  ),
                  Text(
                    'Hy, Buddy',
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.teal,
                        size: 30,
                      ))
                ],
              ),
              JoinCard(),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.teal,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Tab(
                    icon: Icon(Icons.album_outlined),
                    child: Text('NGOs'),
                  ),
                  Tab(
                    icon: Icon(Icons.home_filled),
                    child: Text('Home'),
                  ),
                  Tab(
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
                    NgoList(Colors.white, "Your NGOs"),
                    NgoList(Colors.white, "Nearby NGOs"),
                    Profile()
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
      margin: EdgeInsets.only(top: 30, bottom: 10),
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 155,
      child: Column(
        children: [
          Text(
            'Want to contribute? ',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Join your nearest NGO ',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            onPressed: onPressed,
            color: Colors.white,
            textColor: Colors.blue,
            child: Text('Join Now'),
          )
        ],
      ),
    );
  }

  void onPressed() {}
}
