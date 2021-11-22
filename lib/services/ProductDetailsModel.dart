class ProductDetailsModel {
  ProductDetailsModel(
      {required this.id,
      required this.name,
      required this.summary,
      required this.logo,
      required this.description,
      required this.gallery});

  late final int id;
  late final String name;
  late final String summary;
  late final String logo;
  late final String description;
  late final List<String> gallery;

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    summary = json['summary'];
    logo = json['logo'];
    description = json['description'];
    gallery = List.castFrom<dynamic, String>(json[gallery]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = this.id;
    _data['name'] = this.name;
    _data['summary'] = this.summary;
    _data['description'] = this.description;
    _data['logo'] = this.logo;
    _data['gallery'] = this.gallery;
    return _data;
  }
}
