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
        body: Material(
      elevation: 4,
      color: Colors.white70,
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color(0xfff1f1f1),
        ),
        height: double.infinity,
        padding: EdgeInsets.all(20),
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
              height: 250,
              width: double.infinity,
              child: Image.network(
                widget.image,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.location,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    widget.description,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time: ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Date: ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.time,
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Text(
                  widget.date,
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Organised By:-",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.ngo,
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // background
                    onPrimary: Colors.white, // foreground
                    padding: EdgeInsets.only(
                        right: 20, left: 20, top: 12, bottom: 12),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ));
  }
}
