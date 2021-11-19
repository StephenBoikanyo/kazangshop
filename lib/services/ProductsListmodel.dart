class ProductsListModel {
  ProductsListModel({
    required this.id,
    required this.name,
    required this.summary,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String summary;
  late final String logo;

  ProductsListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    summary = json['summary'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['summary'] = summary;
    _data['logo'] = logo;
    return _data;
  }
}
