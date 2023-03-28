import 'package:FastFeed/model/models/product.dart';

class Collection {
  int? id;
  String title;
  int? store;
  bool? isFeatured;
  List<Product>? products;

  Collection({
    this.id,
    required this.title,
    this.store,
    this.isFeatured,
    this.products,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      store: json['store'],
      isFeatured: json['isFeatured'],
      products: json['products'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'store': store,
        'isFeatured': isFeatured,
        'products': products,
      };
}
