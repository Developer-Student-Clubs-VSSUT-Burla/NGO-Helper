class Event {
  String name;
  String location;
  String description;
  String date;
  String time;
  String ngo;
  String image;

  Event(
    this.name,
    this.location,
    this.description,
    this.date,
    this.time,
    this.ngo,
    this.image,
  );

  Map<String, dynamic> toJson() => {
        'name': name,
        'location': location,
        'description': description,
        'date': date,
        'time': time,
        'ngo': ngo,
        'image': image
      };
}
