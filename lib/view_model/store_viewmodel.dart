import 'dart:async';
import 'package:FastFeed/model/entity/store.dart';
import 'package:FastFeed/model/repository/store_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class StoreViewModel extends ChangeNotifier {
  var repository = StoreRepositoryImpl();

  StreamController<List<Store>> stores =
  StreamController<List<Store>>();

  Future<void> getStores(int id) async {
    stores.add(await repository.getStores(id));
    notifyListeners();
  }
  Future<Store> addStore(Store store) async {
    var newStore = await repository.addStore(store);
    notifyListeners();
    return newStore;
  }
  Future<void> editStore(Store store) async {
    await repository.editStore(store);
    notifyListeners();
  }
  Future<void> deleteStore(Store store) async {
    await repository.deleteStore(store);
    notifyListeners();
  }
}