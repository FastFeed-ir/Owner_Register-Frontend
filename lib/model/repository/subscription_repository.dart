import 'package:FastFeed/model/entity/subscription_model.dart';

abstract class SubscriptonRepository{

  Future<List<SubscriptionModel>> getSubscription(int businessOwnerId);

  Future<void> addSubscription(SubscriptionModel subscription);

  Future<void> editSubscription(SubscriptionModel subscription);

  Future<void> deleteSubscription(SubscriptionModel subscription);
}