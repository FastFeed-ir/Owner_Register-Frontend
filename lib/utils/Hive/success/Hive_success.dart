
import 'package:hive/hive.dart';

part 'Hive_success.g.dart';

@HiveType(typeId: 6)
class HiveSuccessfulPurchase {
  HiveSuccessfulPurchase({
    required this.storeName,
    required this.business_owner,
    this.url,
    required this.period,
    required this.amount,
  });

  @HiveField(0)
  String? storeName;

  @HiveField(1)
  int? business_owner;

  @HiveField(2)
  String? url;

  @HiveField(3)
  int? period;

  @HiveField(4)
  double? amount;

}