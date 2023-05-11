import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/home/components/header_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../main.dart';
import '../../../model/entity/store.dart';
import '../../../model/entity/subscription_model.dart';
import '../../../utils/Hive/owner/Hive_owner.dart';
import '../../../utils/Hive/store/Hive_store.dart';
import '../../../utils/Hive/success/Hive_success.dart';
import '../../../utils/Hive/verifySub/Hive_verifySub.dart';
import '../../../view_model/store_viewmodel.dart';
import '../../../view_model/subscription_viewmodel.dart';
import 'Sub_style.dart';

class VerifyAddSubscriptonScreen extends StatefulWidget {
  HiveVerifySub _hiveVerifySub = verifySubBox.get("AddVerifySub");
  HiveStore _hiveStore = storeBox.get('Store');
  HiveOwner _hiveOwner = ownerBox.get('Owner');
  VerifyAddSubscriptonScreen({super.key});

  @override
  State<VerifyAddSubscriptonScreen> createState() => _VerifyAddSubScreenState();
}

class _VerifyAddSubScreenState extends State<VerifyAddSubscriptonScreen> {
  late int Id;
  late int subId;
  late int _business_owner;
  late String storeName;
  late int storeId;
  late int period;
  late String periodText = "";
  late String url = "";
  late String amountText = "";
  late double amount = 0;
  late double tax = 364000;
  late double totalCost;
  late HiveStore hiveStore;
  late HiveVerifySub hiveVerifySub;
  late HiveOwner hiveOwner;
  final _viewModel = SubscriptionViewModel();
  final _storeViewModel = StoreViewModel();



  @override
  void initState() {
    // TODO isEdit, storeId
    hiveVerifySub = widget._hiveVerifySub;
    hiveOwner = widget._hiveOwner;
    hiveStore = widget._hiveStore;

    //----------------------
    periodText = widget._hiveVerifySub.periodText!;
    period = widget._hiveVerifySub.period!;
    amountText = widget._hiveVerifySub.amountText!;
    amount = widget._hiveVerifySub.amount!;
    if (amount == 0) tax = 0;
    totalCost = amount + tax;
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
              HeaderPanel(),
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
                    // Store
                    Store store = Store(business_owner: hiveStore.business_owner, title: hiveStore.title, business_type: hiveStore.business_type, state: hiveStore.state, city: hiveStore.city, address: hiveStore.address, owner_phone_number: hiveStore.owner_phone_number, telephone_number: hiveStore.telephone_number, tables_count: hiveStore.tables_count, instagram_page_link: hiveStore.instagram_page_link, logo: hiveStore.logo);
                    _storeViewModel
                        .addStore(store)
                        .asStream()
                        .listen((event) async {
                      storeId = event.id ?? 0;
                      storeName = event.title ?? '';
                      _business_owner = store.business_owner ?? 0;
                      _addSubscripton();
                    });
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
    _viewModel.addSubscriptions(subscription).asStream().listen((event) async {
      if (event.id! > 0) {
        successBox.put(
            "Successful",
            HiveSuccessfulPurchase(
              storeName: storeName,
              business_owner: business_owner,
              url: event.url!,
              amount: totalCost,
              period: period,
            ),);
        Get.toNamed(
          SuccessfulPurchasePage,
        );
      }
    });
  }
}
