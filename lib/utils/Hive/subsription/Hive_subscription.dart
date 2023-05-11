import 'package:hive/hive.dart';
part 'Hive_subscription.g.dart';

@HiveType(typeId: 3)
class HiveSubscription {

  HiveSubscription({
    this.id,
    required this.business_owner,
    required this.store,
    required this.period,
    required this.amount,
    this.url,
    this.startDate,
  });
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? business_owner;
  @HiveField(2)
  int? store;
  @HiveField(3)
  int? period;
  @HiveField(4)
  double? amount;
  @HiveField(5)
  String? url;
  @HiveField(6)
  String? startDate;
}