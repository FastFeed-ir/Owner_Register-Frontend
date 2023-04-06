import 'package:FastFeed/model/entity/subscription_model.dart';
import 'package:dio/dio.dart';

import '../util/constants.dart';
import 'subscription_repository.dart';

class SubscriptionRepositoryImpl extends SubscriptonRepository{
  var dio = Dio(options);
  @override
  Future<List<SubscriptionModel>> getSubscription() async{
    var response = await dio.get('subscriptions/');
    print('response: ${response.statusMessage}');
    if(response.data is List){
      List<dynamic> dataList = response.data;
      List<SubscriptionModel> subscriptions = [];
      for(var data in dataList){
        if(data is Map<String, dynamic>){
          subscriptions.add(SubscriptionModel.fromJson(data));
        }
      }
      return subscriptions;
    }else{
      throw Exception('Invalid response');
    }
  }

  @override
  Future<void> addSubscription(SubscriptionModel subscription)  async{
    var response = await dio.post('subscriptions/',data: subscription);
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> editSubscription(SubscriptionModel subscription)  async{
    var response = await dio.patch(
      'subscriptions/${subscription.id}/',
      data: subscription,
    );
    print('response: ${response.statusMessage}');
  }

  Future<void> deleteSubscription(SubscriptionModel subscription) async{
    var response = await dio.delete(
      'subscriptions/${subscription.id}/',
    );
    print('response: ${response.statusMessage}');
  }


}

