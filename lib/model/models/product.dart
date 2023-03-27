class Product {
  int id;
  String title;
  String image;
  String description;
  double unitPrice;
  int inventory;
  bool isAvailable;
  bool isFeatured;
  double discountPercentage;
  int store;
  int collection;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.unitPrice,
    required this.inventory,
    required this.isAvailable,
    required this.isFeatured,
    required this.discountPercentage,
    required this.store,
    required this.collection,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      unitPrice: json['unit_price'],
      inventory: json['inventory'],
      isAvailable: json['is_available'],
      isFeatured: json['is_featured'],
      discountPercentage: json['discount_percentage'],
      store: json['store'],
      collection: json['collection'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'description': description,
        'unit_price': unitPrice,
        'inventory': inventory,
        'is_available': isAvailable,
        'is_featured': isFeatured,
        'discount_percentage': discountPercentage,
        'store': store,
        'collection': collection,
      };
}
