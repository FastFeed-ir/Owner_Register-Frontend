import 'package:FastFeed/model/entity/product.dart';

import '../entity/collection.dart';
import '../util/constants.dart';
import 'collection_repository.dart';

// ignore_for_file: avoid_print
class CollectionRepositoryImpl extends CollectionRepository {
  @override
  Future<List<Collection>> getCollections(int storeId) async {
    var response = await dio.get('collections/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Collection> collections = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var collectionServer = Collection.fromJson(data);
          if (collectionServer.storeId == storeId) {
            collections.add(collectionServer);
          }
        }
      }
      return collections;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<List<Product>> getProducts(int storeId) async {
    var response = await dio.get('products/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Product> products = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var productServer = Product.fromJson(data);
          if (productServer.storeId == storeId) {
            products.add(productServer);
          }
        }
      }
      return products;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Collection> addCollection(Collection collection) async {
    var notNullCollection = Collection(
        title: collection.title,
        storeId: collection.storeId,
        isFeatured: collection.isFeatured ?? false);
    var response = await dio.post(
      'collections/',
      data: notNullCollection,
    );
    print('response: ${response.statusMessage}');
    final newCollection = Collection.fromJson(response.data);
    return newCollection;
  }

  @override
  Future<Product> addProduct(Product product) async {
    var notNullProduct = Product(
        title: product.title,
        image: product.image ?? "",
        description: product.description ?? "",
        unitPrice: product.unitPrice,
        inventory: product.inventory ?? 0,
        isAvailable: product.isAvailable,
        isFeatured: product.isFeatured ?? false,
        discountPercentage: product.discountPercentage ?? 0.0,
        collectionId: product.collectionId,
        storeId: product.storeId);
    var response = await dio.post(
      'products/',
      data: notNullProduct,
    );
    print('response: ${response.statusMessage}');
    final newProduct = Product.fromJson(response.data);
    return newProduct;
  }

  @override
  Future<void> editCollection(Collection collection) async {
    var notNullCollection = Collection(
        id: collection.id,
        title: collection.title,
        storeId: collection.storeId,
        isFeatured: collection.isFeatured ?? false);
    var response = await dio.patch(
      'collections/${notNullCollection.id}/',
      data: notNullCollection,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> editProduct(Product product) async {
    var notNullProduct = Product(
        id: product.id,
        title: product.title,
        image: product.image ?? "",
        description: product.description ?? "",
        unitPrice: product.unitPrice,
        inventory: product.inventory ?? 0,
        isAvailable: product.isAvailable,
        isFeatured: product.isFeatured ?? false,
        discountPercentage: product.discountPercentage ?? 0.0,
        collectionId: product.collectionId,
        storeId: product.storeId);
    var response = await dio.patch(
      'products/${notNullProduct.id}/',
      data: notNullProduct,
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
