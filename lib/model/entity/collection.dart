import 'package:FastFeed/model/entity/product.dart';

class Collection {
  int? id;
  String title;
  int storeId;
  bool? isFeatured;
  List<Product>? products;

  Collection({
    this.id,
    required this.title,
    required this.storeId,
    this.isFeatured,
    this.products,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      storeId: json['store'],
      isFeatured: json['isFeatured'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'store': storeId,
        'isFeatured': isFeatured,
      };
}
