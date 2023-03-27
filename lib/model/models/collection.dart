class Collection {
  int id;
  String title;
  int store;
  bool isFeatured;

  Collection({
    required this.id,
    required this.title,
    required this.store,
    required this.isFeatured,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      store: json['store'],
      isFeatured: json['isFeatured'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'store': store,
        'isFeatured': isFeatured,
      };
}
