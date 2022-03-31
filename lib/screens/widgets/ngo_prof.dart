import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NGOprof extends StatefulWidget {
  String name;
  String desc;
  String location;
  String pfp;

  NGOprof({
    Key? key,
    required this.name,
    required this.desc,
    required this.location,
    required this.pfp,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NGOprofState();
  }
}

class NGOprofState extends State<NGOprof> {
  List<String> imageList = [];
  final myController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    imageList.add(widget.pfp);
    myController.text = widget.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NGO Profile Page'),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 10),
              CarouselSlider(
                  items: imageList
                      .map((e) => ClipRect(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  e,
                                  height: 200,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    height: 150,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.people,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  Text(
                    widget.location,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              Material(
                elevation: 4.0,
                color: Colors.white70,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Container(
                  height: 350,
                  child: TextFormField(
                    readOnly: true,
                    minLines: 2,
                    maxLines: 100,
                    controller: myController,
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: null,
                    child: Column(children: [Icon(Icons.add), Text("Join")]),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Colors.teal,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Column(children: [
                      Icon(Icons.monetization_on),
                      Text("Donate")
                    ]),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Colors.teal,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  ),
                  ElevatedButton(
                    onPressed: () => {Navigator.pushNamed(context, "/chat")},
                    child: Column(children: [Icon(Icons.chat), Text("Chat")]),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Colors.teal,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  ),
                ],
              )
            ],
          )),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add),
      //       label: 'Join',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.monetization_on),
      //       label: 'Donate',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //     ),
      //   ],
      // ),
    );
  }
}
