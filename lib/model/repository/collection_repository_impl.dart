import 'package:FastFeed/model/entity/product.dart';

import '../entity/collection.dart';
import '../util/constants.dart';
import 'collection_repository.dart';

// ignore_for_file: avoid_print
class CollectionRepositoryImpl extends CollectionRepository {
  @override
  Future<List<Collection>> getCollections() async {
    var response = await dio.get('collections/');
    print('response: ${response.statusMessage}');
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

  @override
  Future<List<Product>> getProducts() async {
    var response = await dio.get('products/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Product> products = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          products.add(Product.fromJson(data));
        }
      }
      return products;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Collection> addCollection(Collection collection) async {
    var response = await dio.post(
      'collections/',
      data: collection,
    );
    print('response: ${response.statusMessage}');
    final newCollection = Collection.fromJson(response.data);
    return newCollection;
  }

  @override
  Future<void> addProduct(Product product) async {
    var response = await dio.post(
      'products/',
      data: product,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> editCollection(Collection collection) async {
    var response = await dio.patch(
      'collections/${collection.id}/',
      data: collection,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> editProduct(Product product) async {
    var response = await dio.patch(
      'products/${product.id}/',
      data: product,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> deleteCollection(Collection collection) async {
    var response = await dio.delete(
      'collections/${collection.id}/',
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> deleteProduct(Product product) async {
    var response = await dio.delete(
      'products/${product.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
