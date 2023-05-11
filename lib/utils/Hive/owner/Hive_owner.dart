import 'package:hive/hive.dart';

part 'Hive_owner.g.dart';

@HiveType(typeId: 1)
class HiveOwner {
  HiveOwner({
    this.id,
    required this.phone_number,
    this.first_name,
    this.last_name
  });
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? first_name;

  @HiveField(2)
  String? last_name;

  @HiveField(3)
  String? phone_number;

}