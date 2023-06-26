import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/home/components/header_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../model/entity/store.dart';
import '../../../model/entity/subscription_model.dart';
import '../../../view_model/store_viewmodel.dart';
import '../../../view_model/subscription_viewmodel.dart';
import 'Sub_style.dart';

class VerifySubscriptonScreen extends StatefulWidget {
  var subscription = Get.arguments;

  VerifySubscriptonScreen({super.key});

  @override
  State<VerifySubscriptonScreen> createState() => _VerifySubScreenState();
}

class _VerifySubScreenState extends State<VerifySubscriptonScreen> {
  late int Id;
  late int subId;
  late int _business_owner;
  late String storeName;
  late int storeId;
  late int period;
  late String url = "";
  late String amountText = "";
  late double amount = 0;
  late double tax = 364000;
  late double totalCost;
  late dynamic pageType;
  final _viewModel = SubscriptionViewModel();
  final _storeViewModel = StoreViewModel();
  late int oldPeriod;

  @override
  void initState() {
    // TODO isEdit, storeId
    Id = widget.subscription[0];
    amountText = widget.subscription[1];
    period = widget.subscription[2];
    amountText = widget.subscription[3];
    amount = widget.subscription[4];
    if (amount == 0) tax = 0;
    totalCost = amount + tax;
    pageType = widget.subscription[5];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO get ID
              HeaderPanel(ID: Id),
              verifySubscripton(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
  Widget verifySubscripton() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        286.0.w,
        50.0.h,
        286.0.w,
        81.0.h,
      ),
      //width: 1920.w,
      height: 720.0.h,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubBuyTextStyle(text: "خرید اشتراک"),
            ],
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubBuyTextStyle(text: "مبلغ :"),
              SubBuyTextStyle(text: amountText),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SubBuyTextStyle(text: "9درصد مالیات بر ارزش افزوده"),
              SubBuyTextStyle(text: "${tax} تومان"),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubBuyTextStyle(text: "مبلغ قابل پرداخت"),
              Row(
                children: [
                  SubBuyTextStyle(text: "${totalCost}".seRagham()),
                  SubBuyTextStyle(text: " تومان"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        buildInfoDialog(context, "قوانین ", RulesPhrase),
                  );
                },
                child: SubTitleStyle(text: "قوانین "),
              ),
              SizedBox(
                width: 20.w,
              ),
              ElevatedButton(
                onPressed: () {
                  // ToDo Get To Bank Gateway then Get To SuccessfulPurchase or UnSuccessfulPurchasePage
                  if (pageType is Store) {
                    // Store
                    Store store = pageType;
                    _storeViewModel.addStore(store).asStream().listen((event) async {
                      storeId = event.id ?? 0;
                      storeName = event.title ?? '';
                      _business_owner = store.business_owner?? 0;
                      _addSubscripton();
                    });
                  } else {
                    // revival
                    SubscriptionModel sub = pageType;
                    subId = sub.id ?? 0;
                    _business_owner = sub.business_owner ?? 0;
                    storeId = sub.store!;
                    oldPeriod = sub.period ?? 0;
                    _editSubscripton();
                    Get.toNamed(HomePage,arguments: _business_owner);
                  }
                  //Get.toNamed(UnSuccessfulPurchasePage,arguments: [period, amount+tax],);
                },
                child: SubBuyTextStyle(text: "قبول قوانین و خرید اشتراک"),
                style: buttonStyle_build(396, 70, 10, YellowColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addSubscripton() {
    var business_owner = _business_owner;
    var store = storeId;
    var period = this.period;
    var amount = totalCost;
    SubscriptionModel subscription = SubscriptionModel(
      business_owner: business_owner,
      store: store,
      period: period,
      amount: amount,
    );
    _viewModel.addSubscriptions(subscription).asStream().listen((event) async{
      if(event.id! > 0){
        Get.toNamed(
          SuccessfulPurchasePage,
          arguments: [period, totalCost, storeName, business_owner,event.url],
        );
      }
    });

  }

  void _editSubscripton() {
    var id = subId;
    var business_owner = _business_owner;
    var store = storeId;
    var period = this.period + oldPeriod;
    var amount = totalCost;
    SubscriptionModel subscription = SubscriptionModel(
      id: id,
      business_owner: business_owner,
      store: store,
      period: period,
      amount: amount,
    );
    _viewModel.editSubscriptions(subscription);
  }
}
