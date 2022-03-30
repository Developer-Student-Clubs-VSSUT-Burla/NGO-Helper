import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{
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
    organized.text = "";//set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Login form"),
        backgroundColor: Colors.cyan, //background color of app bar
      ),
      body: Form(
          child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                TextFormField(
                  controller: username,
                  maxLength: 19,
                  decoration: InputDecoration(
                    labelText: "Username", //babel text
                    prefixIcon: Icon(Icons.people_outline_rounded), //prefix iocn
                    hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                    labelStyle: TextStyle(fontSize: 13, color: Colors.cyan), //label style
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child:TextField(
                      controller: dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date",
                        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 13, color: Colors.cyan),//label text of field
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101),
                        );

                        if(pickedDate != null ){
                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text = formattedDate; //set output date to TextField value.
                          });
                        }else{
                          print("Date is not selected");
                        }
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child:TextField(
                    controller: location,
                    decoration: InputDecoration(
                      labelText: "Location", //babel text
                      prefixIcon: Icon(Icons.location_on), //prefix iocn
                      hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                      labelStyle: TextStyle(fontSize: 13, color: Colors.cyan), //label style
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child:TextField(
                    controller: time,
                    decoration: InputDecoration(
                      labelText: "Time", //babel text
                      prefixIcon: Icon(Icons.timelapse), //prefix iocn
                      hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                      labelStyle: TextStyle(fontSize: 13, color: Colors.cyan), //label style
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child:TextField(
                    controller: description,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: "Description", //babel text
                      prefixIcon: Icon(Icons.description), //prefix iocn
                      hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                      labelStyle: TextStyle(fontSize: 13, color: Colors.cyan), //label style
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(1),
                  child:TextField(
                    controller: organized,
                    decoration: InputDecoration(
                      labelText: "Organized By", //babel text
                      prefixIcon: Icon(Icons.business), //prefix iocn
                      hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                      labelStyle: TextStyle(fontSize: 13, color: Colors.cyan), //label style
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () { },
                      child: Text('Register'),
                    )
                  ],
                )
              ]
          )
      ),
    );
  }
}