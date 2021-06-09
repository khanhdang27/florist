class Status {
  int id;
  String acronym;
  String name;

  Status({this.id, this.acronym, this.name});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acronym = json['acronym'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['acronym'] = this.acronym;
    data['name'] = this.name;
    return data;
  }
}