import 'package:FastFeed/model/entity/owner.dart';

abstract class OwnerRepository{
  Future<List<Owner>> getOwners();

  Future<List<Owner>> searchOwners(int id);

  Future<Owner> addOwner(Owner owner);

  Future<void> editOwner(Owner owner);

  Future<void> deleteOwner(Owner owner);
}