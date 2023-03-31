import 'package:dio/dio.dart';

import '../entity/collection.dart';
import '../util/constants.dart';
import 'collection_repository.dart';

class CollectionRepositoryImpl extends CollectionRepository {
  var dio = Dio(options);

  @override
  Future<void> addCollection(Collection collection) async {
    var response = await dio.post(
      'collections',
      queryParameters: {
        'title': collection.title,
        'store': collection.store,
        'is_featured': collection.isFeatured
      },
    );
  }

  @override
  Future<List<Collection>> getCollections() async {
    var response = await dio.get('collections');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Collection> collections = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          collections.add(Collection.fromJson(data));
        }
      }
      return collections;
    } else {
      throw Exception('Invalid response');
    }
  }
}
