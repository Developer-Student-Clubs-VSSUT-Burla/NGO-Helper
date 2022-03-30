import 'package:flutter/material.dart';


import 'package:ngo_helper/screens/models/ngo_model.dart';
import 'package:ngo_helper/screens/services/database_services.dart';

class NgoList extends StatelessWidget {
  final Color c;
  final String name;

  const NgoList(this.c, this.name, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: c,
      ),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const TextButton(
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.teal),
                ),
                onPressed: null,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: DatabaseService().getNgos(),
                builder: (ctx, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occured',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (ctx, index) {
                            NGO ngo = snapshot.data[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/ngoprof');
                                  },
                                  child: NgoItem(
                                      name: ngo.name,
                                      desc: ngo.desc,
                                      location: ngo.location,
                                      pfp: ngo.pfp),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          });
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NgoItem extends StatelessWidget {
  final String name, desc, pfp, location;

  const NgoItem(
      {Key? key,
      required this.name,
      required this.desc,
      required this.pfp,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xfff1f1f1),
      ),
      height: 200,
      padding: const EdgeInsets.only(left: 24, right: 5),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.transparent,
            ),
            height: 100,
            width: MediaQuery.of(context).size.width * 0.65,
            child: Image.network(
              pfp,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            location,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
