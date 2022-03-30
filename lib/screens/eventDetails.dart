import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  String name;
  String location;
  String description;
  String date;
  String time;
  String ngo;
  String image;

  EventDetails({
    required this.name,
    required this.location,
    required this.description,
    required this.date,
    required this.time,
    required this.ngo,
    required this.image,
  });

  @override
  State<StatefulWidget> createState() {
    return EventDetailsState();
  }
}

class EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xfff1f1f1),
      ),
      height: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      width: double.infinity,
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
            height: 200,
            width: double.infinity,
            child: Image.network(
              widget.image,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.date,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.location,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                widget.time,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Organised By:-",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.ngo,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => {},
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
                color: Colors.white,
                textColor: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
