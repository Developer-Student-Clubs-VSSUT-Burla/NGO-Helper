import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/screens/models/ngo_model.dart';


class DatabaseService{

  Future<List<NGO>> getNgos() async{
    List<NGO> ngolist=  [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("NGOs").get();

    for(int i=0;i<querySnapshot.docs.length;i++)
    {
      String name= querySnapshot.docs[i]['name'];
      String desc= querySnapshot.docs[i]['desc'];
      String pfp= querySnapshot.docs[i]['pfp'];
      String location= querySnapshot.docs[i]['location'];
      ngolist.add(NGO(name,desc,pfp,location));
    }

    return ngolist;
  }

}