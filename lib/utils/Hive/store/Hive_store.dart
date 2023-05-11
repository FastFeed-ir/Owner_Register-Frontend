import 'package:hive/hive.dart';
part 'Hive_store.g.dart';

@HiveType(typeId: 2)
class HiveStore {
  HiveStore({
    this.id,
    required this.business_owner,
    required this.title,
    this.logo,
    required this.business_type,
    required this.state,
    this.city,
    this.address,
    required this.owner_phone_number,
    required this.telephone_number,
    required this.tables_count,
    this.instagram_page_link,
  });
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? business_owner;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? logo;
  @HiveField(4)
  int? business_type;
  @HiveField(5)
  int? state;
  @HiveField(6)
  String? city ;
  @HiveField(7)
  String? address ;
  @HiveField(8)
  String? owner_phone_number;
  @HiveField(9)
  String? telephone_number;
  @HiveField(10)
  int? tables_count;
  @HiveField(11)
  String? instagram_page_link;
}