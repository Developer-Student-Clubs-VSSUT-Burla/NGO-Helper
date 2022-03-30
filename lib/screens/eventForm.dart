import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventFormState();
  }
}

class EventFormState extends State<EventForm> {
  TextEditingController username = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController organized = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    username.text = "";
    dateinput.text = "";
    location.text = "";
    time.text = "";
    description.text = "";
    organized.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Event",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.cyan, //background color of app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color(0xfff1f1f1),
        ),
        height: double.infinity,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Form(
            child: ListView(padding: EdgeInsets.all(10), children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 40),
            child: TextFormField(
              controller: username,
              decoration: InputDecoration(
                labelText: "Event Name",
                icon: Icon(Icons.people_outline_rounded),
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                labelStyle: TextStyle(fontSize: 17, color: Colors.cyan),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 40),
            child: TextField(
                controller: dateinput,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Enter Date",
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  labelStyle: TextStyle(
                      fontSize: 17, color: Colors.cyan), //label text of field
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 40),
            child: TextField(
              controller: time,
              decoration: InputDecoration(
                labelText: "Time", //babel text
                icon: Icon(Icons.timelapse), //prefix iocn
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), //hint text style
                labelStyle:
                    TextStyle(fontSize: 17, color: Colors.cyan), //label style
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 40),
            child: TextField(
              controller: location,
              decoration: InputDecoration(
                labelText: "Location",
                icon: Icon(Icons.location_on),
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                labelStyle: TextStyle(fontSize: 17, color: Colors.cyan),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 40),
            child: TextField(
              controller: organized,
              decoration: InputDecoration(
                labelText: "Organized By",
                icon: Icon(Icons.business),
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                labelStyle: TextStyle(fontSize: 17, color: Colors.cyan),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: TextField(
              controller: description,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(fontSize: 17, color: Colors.cyan),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 10,
                      color: Colors.cyan,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 12, bottom: 12),
                ),
                onPressed: () {},
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )
        ])),
      ),
    );
  }
}
