import 'dart:async';
import 'package:FastFeed/model/entity/store.dart';
import 'package:FastFeed/model/repository/store_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class StoreViewModel extends ChangeNotifier {
  var repository = StoreRepositoryImpl();

  StreamController<List<Store>> stores =
  StreamController<List<Store>>();

  void getStores() async {
    stores.add(await repository.getStores());
    notifyListeners();
  }
  void addStore(Store store) async {
    repository.addStore(store);
    notifyListeners();
  }
  void editStore(Store store) async {
    repository.editStore(store);
    notifyListeners();
  }
  void deleteStore(Store store) async {
    repository.deleteStore(store);
    notifyListeners();
  }
}