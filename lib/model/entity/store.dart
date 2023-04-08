
class Store{
  String title;
  String? logo;
  String business_type;
  String state;
  String? city ;
  String? address ;
  int telephone_number;
  int tables_count;
  String? instagram_page_link;

  Store({
    required this.title,
    this.logo,
    required this.business_type,
    required this.state,
    this.city,
    this.address,
    required this.telephone_number,
    required this.tables_count,
    this.instagram_page_link,
});
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      title: json['title'],
      logo: json['logo'],
      business_type: json['business_type'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
      telephone_number: json['telephone_number'],
      tables_count: json['tables_count'],
      instagram_page_link: json['instagram_page_link'],
    );
  }
  Map<String, dynamic> toJson() => {
    'title': title,
    'logo': logo,
    'business_type': business_type,
    'state': state,
    'city': city,
    'address': address,
    'telephone_number': telephone_number,
    'tables_count': tables_count,
    'instagram_page_link': instagram_page_link,
  };
}