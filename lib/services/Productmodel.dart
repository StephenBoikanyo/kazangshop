class Productmodel {
  Productmodel({
    required this.id,
    required this.name,
    required this.summary,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String summary;
  late final String logo;

  Productmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    summary = json['summary'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = this.id;
    _data['name'] = this.name;
    _data['summary'] = this.summary;
    _data['logo'] = this.logo;
    return _data;
  }
}
