import 'dart:async';
import 'package:FastFeed/model/entity/owner.dart';
import 'package:FastFeed/model/repository/owner_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class OwnerViewModel extends ChangeNotifier {
  var repository = OwnerRepositoryImpl();

  StreamController<List<Owner>> owners =
  StreamController<List<Owner>>();

  void getOwners() async {
    owners.add(await repository.getOwners());
    notifyListeners();
  }
  void addOwner(Owner owner) async {
    repository.addOwner(owner);
    notifyListeners();
  }
  void editOwner(Owner owner) async {
    repository.editOwner(owner);
    notifyListeners();
  }
  void deleteOwner(Owner owner) async {
    repository.deleteOwner(owner);
    notifyListeners();
  }
}