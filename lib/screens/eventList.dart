import 'package:flutter/material.dart';
import 'package:ngo_helper/screens/eventDetails.dart';
import 'package:ngo_helper/screens/models/event_model.dart';
import 'package:ngo_helper/screens/services/database_services.dart';

class EventList extends StatelessWidget {
  final Color c;
  final String name;

  const EventList(this.c, this.name, {Key? key}) : super(key: key);
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
                future: DatabaseService().getEvents(),
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
                            Event event = snapshot.data[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventDetails(
                                          name: event.name,
                                          location: event.location,
                                          description: event.description,
                                          date: event.date,
                                          time: event.time,
                                          ngo: event.ngo,
                                          image: event.image,
                                        ),
                                      ),
                                    );
                                  },
                                  child: EventItem(
                                    name: event.name,
                                    location: event.location,
                                    description: event.description,
                                    date: event.date,
                                    time: event.time,
                                    ngo: event.ngo,
                                    image: event.image,
                                  ),
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

class EventItem extends StatelessWidget {
  final String name, location, description, date, time, ngo, image;

  const EventItem({
    Key? key,
    required this.name,
    required this.location,
    required this.description,
    required this.date,
    required this.time,
    required this.ngo,
    required this.image,
  }) : super(key: key);

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
              image,
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
