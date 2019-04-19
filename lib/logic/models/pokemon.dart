class Pokemon {
  String name;
  String url;
  String id;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    final paths = json['url'].toString().split('/');
    name = json['name'];
    url = json['url'];
    id = paths[paths.length - 2].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}
