import 'package:FastFeed/model/entity/product.dart';
import 'package:dio/dio.dart';

import '../entity/collection.dart';
import '../util/constants.dart';
import 'collection_repository.dart';

class CollectionRepositoryImpl extends CollectionRepository {
  var dio = Dio(options);

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

  @override
  Future<List<Product>> getProducts() async {
    var response = await dio.get('products');
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
  Future<void> addCollection(Collection collection) async {
    // TODO: implement addCollection
    var response = await dio.post(
      'collections',
      queryParameters: {
        'title': collection.title,
        'store': collection.storeId,
        'is_featured': collection.isFeatured
      },
    );
  }

  @override
  Future<void> addProduct(Product product) async {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> editCollection(Collection collection) async {
    // TODO: implement editCollection
    throw UnimplementedError();
  }

  @override
  Future<void> editProduct(Product product) async {
    // TODO: implement editProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCollection(Collection collection) async {
    // TODO: implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(Product product) async {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
}
