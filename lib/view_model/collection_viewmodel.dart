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
    products.add(await repository.getProducts());
    notifyListeners();
  }

  void addCollection(Collection collection) async {
    repository.addCollection(collection);
    notifyListeners();
  }

  void addProduct(Product product) async {
    repository.addProduct(product);
    notifyListeners();
  }

  void editCollection(Collection collection) async {
    repository.editCollection(collection);
    notifyListeners();
  }

  void editProduct(Product product) async {
    repository.editProduct(product);
    notifyListeners();
  }

  void deleteCollection(Collection collection) async {
    repository.deleteCollection(collection);
    notifyListeners();
  }

  void deleteProduct(Product product) async {
    repository.deleteProduct(product);
    notifyListeners();
  }
}
