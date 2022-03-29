class NGO{
  String name;
  String desc;
  String pfp;
  String location;

  NGO(this.name,this.desc,this.pfp,this.location);

  Map<String, dynamic> toJson() => {
        'name': name,
        'desc': desc,
        'pfp':pfp,
        'location': location
      };
}