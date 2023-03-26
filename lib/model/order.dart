class Order {
  final String? id;
  final Map<String, int>? products;
  final int? table;
  final double? totalAmount;
  final String? description;
  final bool? isCurrent;
  final String? store;
  final String? authCode;
  final String? created_at;

  Order({
    this.id,
    this.products,
    this.table,
    this.totalAmount,
    this.created_at,
    this.description,
    this.isCurrent,
    this.store,
    this.authCode,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    Map<String, int> products = {};
    json['products'].forEach((productId, count) {
      products[productId] = count;
    });
    return Order(
      id: json['id'],
      products: products,
      table: json['table'],
      totalAmount: json['total_amount'],
      created_at: json['order_time'],
      description: json['description'],
      isCurrent: json['is_current'],
      store: json['store'],
      authCode: json['auth_code'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> products = {};
    this.products?.forEach((productId, count) {
      products[productId] = count;
    });
    return {
      'id': id,
      'products': products,
      'table': table,
      'total_amount': totalAmount,
      'created_at': created_at,
      'description': description,
      'is_current': isCurrent,
      'store': store,
      'auth_code': authCode,
    };
  }
}
