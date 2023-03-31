import '../entity/collection.dart';

abstract class CollectionRepository {
  Future<void> addCollection(Collection collection);

  Future<List<Collection>> getCollections();
}
