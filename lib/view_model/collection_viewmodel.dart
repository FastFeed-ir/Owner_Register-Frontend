import 'dart:async';

import 'package:FastFeed/model/repository/collection_repository_impl.dart';
import 'package:flutter/cupertino.dart';

import '../model/entity/collection.dart';

class CollectionViewModel extends ChangeNotifier {
  var repository = CollectionRepositoryImpl();

  StreamController<List<Collection>> collections =
      StreamController<List<Collection>>();

  void addCollection(Collection collection) async {
    var response = repository.addCollection(collection);
    notifyListeners();
  }

  void getCollections() async {
    collections.add(await repository.getCollections());
    notifyListeners();
  }
}
