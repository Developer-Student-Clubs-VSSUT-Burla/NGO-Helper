// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NgoList extends StatelessWidget {
  Color c;
  String name;

  NgoList(this.c, this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: c,
      ),
      padding: EdgeInsets.only(top:15,left: 15,right:15,bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.teal),
                ),
                onPressed: null,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                NgoItem(),
                SizedBox(
                  height: 10,
                ),
                NgoItem(),
                SizedBox(height: 10,),
                NgoItem()
              ],
            ),
          )),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

class NgoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xfff1f1f1),
      ),
      height: 200,
      padding: EdgeInsets.only(left: 24, right: 5),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.transparent,
            ),
            height: 100,
            width: MediaQuery.of(context).size.width * 0.65,
            child: Image.asset(
              'lib/assets/images/Thumbnail.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name of the organisation',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'location',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
