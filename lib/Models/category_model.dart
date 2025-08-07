class CategoryModel {
  CategoryModel({
      this.slug, 
      this.name, 
      this.url,});

  CategoryModel.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }
  String? slug;
  String? name;
  String? url;
CategoryModel copyWith({  String? slug,
  String? name,
  String? url,
}) => CategoryModel(  slug: slug ?? this.slug,
  name: name ?? this.name,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = slug;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}