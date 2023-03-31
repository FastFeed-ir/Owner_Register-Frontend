import 'dart:async';

import 'package:FastFeed/model/entity/product.dart';
import 'package:FastFeed/model/repository/collection_repository_impl.dart';
import 'package:flutter/cupertino.dart';

import '../model/entity/collection.dart';

class CollectionViewModel extends ChangeNotifier {
  var repository = CollectionRepositoryImpl();

  StreamController<List<Collection>> collections =
      StreamController<List<Collection>>();
  StreamController<List<Product>> products = StreamController<List<Product>>();

  void getCollections() async {
    collections.add(await repository.getCollections());
    notifyListeners();
  }

  void getProducts() async {
    //TODO getProducts
    products.add(await repository.getProducts());
    notifyListeners();
  }

  void addCollection(Collection collection) async {
    //TODO addCollection
    var response = repository.addCollection(collection);
    notifyListeners();
  }

  void addProduct(Product product) async {
    //TODO addProduct
    var response = repository.addProduct(product);
    notifyListeners();
  }

  void editCollection(Collection collection) async {
    //TODO editCollection
    var response = repository.editCollection(collection);
    notifyListeners();
  }

  void editProduct(Product product) async {
    //TODO editProduct
    var response = repository.editProduct(product);
    notifyListeners();
  }

  void deleteCollection(Collection collection) async {
    //TODO deleteCollection
    var response = repository.deleteCollection(collection);
    notifyListeners();
  }

  void deleteProduct(Product product) async {
    //TODO deleteProduct
    var response = repository.deleteProduct(product);
    notifyListeners();
  }
}
