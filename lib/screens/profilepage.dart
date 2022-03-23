import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.teal,
        ),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [GalleryImage(), GalleryImage(), GalleryImage()],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(
                      'Your Gallery',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(radius: 25, backgroundImage: AssetImage('assests/Thumbnail.jpg'),),
                    Divider(color: Colors.black,height: 30,thickness: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Dhairya Joshi',style: TextStyle(color: Colors.white,fontSize: 20),),
                        Text('joshidhairaya2002@gmail.com',style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0x55ffffff)
                  ),
                  height: 250,
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bio',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                          IconButton(onPressed: null, icon: Icon(Icons.edit,color: Colors.white,)),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text('Some sample Bio',style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                )

              ],
            ),
          ),
        ));
  }
}

class GalleryImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 160,
      width: 120,
      margin: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: Image.asset(
        'assests/Thumbnail.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

