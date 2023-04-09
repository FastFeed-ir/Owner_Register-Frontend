import 'package:FastFeed/model/entity/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/entity/store.dart';
import '../../../utils/constants.dart';
import '../../../view_model/store_viewmodel.dart';
import '../../../view_model/subscription_viewmodel.dart';
import '../../header_footer/components/footer.dart';
import 'Home_style.dart';
import 'header_panel.dart';

class RestaurantListScreen extends StatefulWidget {
  var Id = Get.arguments;

  RestaurantListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  int? id;
  late int storeId;
  late int period;
  late double amount;
  String? url;
  String? startDate;

  final List<SubscriptionModel> _subs = [];
  final List<Store> _stores = [];
  final _subModel = SubscriptionViewModel();
  final _storeModel = StoreViewModel();

  @override
  initState() {
    getStore();
    getSubscripton();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPanel(ID: widget.Id,),
              SingleChildScrollView(child: restaurantList()),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget restaurantList() {
    // TODO: implement build
    if (_subs.isEmpty) {
      return Container(
        padding: EdgeInsets.only(
          left: 150.0.w,
          top: 51.0.h,
          right: 150.0.w,
        ),
        width: 1920.w,
        height: 700.h,
        child: Center(
          //TODO Empty list dialog
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                SadFace,
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              RestaurantTextStyle(text: "اشتراکی وجود ندارد"),
            ],
          ),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 51.0.h,
        right: 150.0.w,
      ),
      width: 1920.w,
      //height: ((300 * _subs.length) + 300).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            itemCount: _subs.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 700.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              // TODO loaing
              SubscriptionModel subscriptionModel = _subs[index];
              Store store = Store(business_owner: 0, title: '', business_type: 0, state: 0, telephone_number: '', tables_count: 0);
              for(var item in _stores) {
                if(subscriptionModel.store == item.id){
                  store = item;
                }
              }
              return buildlist(subscriptionModel, store, index);
            },
          ),
        ],
      ),
    );
  }
  Widget buildlist(SubscriptionModel subscriptionModel, Store store, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          // ToDo get name from API
          title: restaurantTitle(store.title,
              RestaurantLogoDef, subscriptionModel.startDate),
          shape: RoundedRectangleBorder(
            //<-- SEE HERE
            side: BorderSide(width: 2.w),
            borderRadius: BorderRadius.circular(20.r),
          ),
          subtitle: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: SubButtonTextStyle(
                      text: 'تغییر منو',
                    ),
                    style:
                    buttonStyle_build(300, 70, 20, YellowColor),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var id = subscriptionModel.id;
                      var business_owner = subscriptionModel.business_owner;
                      var storeId = subscriptionModel.store;
                      period = subscriptionModel.period!;
                      amount = subscriptionModel.amount!;
                      SubscriptionModel subModel = SubscriptionModel(id: id,business_owner: business_owner, store: storeId, period: period, amount: amount,);
                      Get.toNamed(SubscriptionPage, arguments: subModel);
                    },
                    child: SubButtonTextStyle(
                      text: 'تمدید اشتراک',
                    ),
                    style:
                    buttonStyle_build(300, 70, 20, YellowColor),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
  void getSubscripton() {
    _subModel.getSubscriptions(widget.Id);
    _subModel.subscriptions.stream.listen((list) {
      setState(() {
        _subs.addAll(list);
      });
    });
  }

  void getStore() {
    _storeModel.getStores(widget.Id);
    _storeModel.stores.stream.listen((list) {
      setState(() {
        _stores.addAll(list);
      });
    });
  }
}
