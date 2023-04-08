class SubscriptionModel {
  int? id;
  int? storeId;
  String? period;
  double? price;
  String? url;
  String? startDate;
  SubscriptionModel({
    this.id,
    this.storeId,
    this.period,
    this.price,
    this.url,
    this.startDate,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      storeId: json['store'],
      period: json['period'],
      price: double.parse(json['price']),
      url: json['url'],
      startDate: json['start_date'],
    );
  }

  Map<String, dynamic> toJson() => {
    'store': storeId,
    'period': period,
    'price':price,
    'url': url,
    'start_date':startDate,
  };
}