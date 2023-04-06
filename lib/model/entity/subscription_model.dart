class SubscriptionModel {
  int? id;
  late int storeId;
  late String period;
  late double amount;
  late String url;
  late String startDate;
  SubscriptionModel({
    this.id,
    required this.storeId,
    required this.period,
    required this.amount,
    required this.url,
    required this.startDate,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      storeId: json['store'],
      period: json['period'],
      amount: double.parse(json['amount']),
      url: json['url'],
      startDate: json['start_date'],
    );
  }

  Map<String, dynamic> toJson() => {
    'store': storeId,
    'period': period,
    'amount':amount,
    'url': url,
    'start_date':startDate,
  };
}