import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.teal,
      ),
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  GalleryImage(),
                  GalleryImage(),
                  GalleryImage(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: const [
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage('lib/assets/images/Thumbnail.jpg'),
                ),
                const Divider(
                  color: Colors.black,
                  height: 30,
                  thickness: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${user.displayName}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      '${user.email}',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color(0x55ffffff)),
              height: 250,
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Bio',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Some sample Bio',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  const GalleryImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 120,
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: Image.asset(
        'lib/assets/images/Thumbnail.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
