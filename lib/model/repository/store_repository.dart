import 'package:FastFeed/model/entity/store.dart';

abstract class StoreRepository{
  Future<List<Store>> getStores();

  Future<void> addStore(Store store);

  Future<void> editStore(Store store);

  Future<void> deleteStore(Store store);
}