import 'package:FastFeed/model/entity/store.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';
import 'store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  var dio = Dio(options);

  @override
  Future<List<Store>> getStores() async {
    var response = await dio.get('stores/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Store> stores = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          stores.add(Store.fromJson(data));
        }
      }
      return stores;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<void> addStores(Store store) async {
    var response = await dio.post(
      'collections/',
      data: store,
    );
    print('response: ${response.statusMessage}');
  }
}