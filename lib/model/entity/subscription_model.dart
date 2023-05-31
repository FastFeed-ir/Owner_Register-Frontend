class SubscriptionModel {
  int? id;
  int? business_owner;
  int? store;
  int? period;
  double? amount;
  String? url;
  String? store_title;
  String? created_at;
  SubscriptionModel({
    this.id,
    required this.business_owner,
    required this.store,
    required this.period,
    required this.amount,
    this.url,
    this.store_title,
    this.created_at,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      business_owner: json['business_owner'],
      store: json['store'],
      period: json['period'],
      amount: double.parse(json['amount']),
      url: json['url'],
      store_title: json['store_title'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'store': store,
    'period': period,
    'amount': amount,
  };
}
