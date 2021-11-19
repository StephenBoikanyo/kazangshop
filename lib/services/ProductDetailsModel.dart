class ProductDetailsModel {
  ProductDetailsModel(
      {required this.id,
      required this.name,
      required this.summary,
      required this.logo,
      required this.gallery});

  late final int id;
  late final String name;
  late final String summary;
  late final String logo;
  late final List<String> gallery;

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    summary = json['summary'];
    logo = json['logo'];
    gallery:
    List<String>.from(json['gallery'].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['summary'] = summary;
    _data['logo'] = logo;
    _data['gallery'] = gallery;
    return _data;
  }
}
