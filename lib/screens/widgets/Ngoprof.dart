import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NGOprof extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Testing',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('NGO Profile Page'),
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share,
                  color: Colors.black),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Body(),
        bottomNavigationBar: BottomNavigationBar(
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Join',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Donate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body>{
  List<String> imageList=[
    "https://thumbs.dreamstime.com/z/ngo-activity-doctor-examine-child-health-clinic-center-which-organized-half-india-s-children-under-age-63979746.jpg",
    "https://thumbs.dreamstime.com/b/rural-education-ngo-activities-teaching-young-indian-children-india-outdoors-temporary-classroom-boards-child-literacy-50806157.jpg",
    "https://thumbs.dreamstime.com/b/ngo-hiv-children-kolkata-based-has-developed-complete-network-services-designed-to-integrate-living-aids-65395259.jpg",
    "https://thumbs.dreamstime.com/b/hiv-children-group-affected-students-posed-residential-center-kolkata-based-ngo-has-developed-complete-network-65395645.jpg",
  ];





  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        child:Column(
          children: <Widget> [
            SizedBox(height:10),
            CarouselSlider(items: imageList.map((e) => ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(e,
                    height: 200,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            )).toList(), options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              height: 150,

            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gallery",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),),
                Text("See All",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name of the NGO",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                Icon(
                  Icons.people,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("NGO1",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                Text("45 members",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.teal,
                  ),),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color:Colors.red,
                ),
                Text("Location",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.teal,
                  ),),
              ],
            ),

            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Material(
              elevation: 4.0,
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child:TextFormField(
                readOnly: true,
                minLines: 2,
                maxLines: 100,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'description',
                  contentPadding: EdgeInsets.symmetric(vertical: 150.0,horizontal: 10.0),
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),

            ),

          ],
        )
    );

  }
}