import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngo_helper/screens/models/event_model.dart';
import 'package:ngo_helper/screens/models/ngo_model.dart';

class DatabaseService {
  Future<List<NGO>> getNgos() async {
    List<NGO> ngolist = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("NGOs").get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      String name = querySnapshot.docs[i]['name'];
      String desc = querySnapshot.docs[i]['desc'];
      String pfp = querySnapshot.docs[i]['pfp'];
      String location = querySnapshot.docs[i]['location'];
      ngolist.add(NGO(name, desc, pfp, location));
    }

    return ngolist;
  }

  Future<List<Event>> getEvents() async {
    List<Event> eventlist = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Events").get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      String name = querySnapshot.docs[i]['name'];
      String location = querySnapshot.docs[i]['location'];
      String description = querySnapshot.docs[i]['description'];
      String date = querySnapshot.docs[i]['date'];
      String time = querySnapshot.docs[i]['time'];
      String ngo = querySnapshot.docs[i]['ngo'];
      String image = querySnapshot.docs[i]['image'];
      eventlist.add(Event(name, location, description, date, time, ngo, image));
    }

    return eventlist;
  }
}
