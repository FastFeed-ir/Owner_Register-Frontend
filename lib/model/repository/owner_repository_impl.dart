import 'package:FastFeed/model/entity/owner.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';
import 'owner_repository.dart';


class OwnerRepositoryImpl extends OwnerRepository {
  var dio = Dio(options);

  @override
  Future<List<Owner>> getOwners() async {
    var response = await dio.get('owners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          owners.add(Owner.fromJson(data));
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<void> addOwner(Owner owner) async {
    var response = await dio.post(
      'stores/',
      data: owner,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> editOwner(Owner owner) async {
    var response = await dio.patch(
      'stores/${owner.id}/',
      data: owner,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteOwner(Owner owner) async {
    var response = await dio.delete(
      'stores/${owner.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}