import 'package:hive/hive.dart';

part 'Hive_verifySub.g.dart';

@HiveType(typeId: 5)
class HiveVerifySub {
  HiveVerifySub({
    required this.periodText,
    required this.period,
    required this.amountText,
    required this.amount,
  });
  @HiveField(0)
  String? periodText;

  @HiveField(1)
  int? period;

  @HiveField(2)
  String? amountText;

  @HiveField(3)
  double? amount;

}