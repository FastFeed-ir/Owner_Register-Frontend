import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/home/components/header_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../main.dart';
import '../../../model/entity/subscription_model.dart';
import '../../../utils/Hive/owner/Hive_owner.dart';
import '../../../utils/Hive/subsription/Hive_subscription.dart';
import '../../../utils/Hive/verifySub/Hive_verifySub.dart';
import '../../../view_model/subscription_viewmodel.dart';
import 'Sub_style.dart';

class VerifyEditSubscriptonScreen extends StatefulWidget {
  final HiveVerifySub _hiveVerifySub = verifySubBox.get("EditVerifySub");
  final HiveSubscription _hiveSubscription = subBox.get('Subscription');
  final HiveOwner _hiveOwner = ownerBox.get('Owner');

  VerifyEditSubscriptonScreen({super.key});

  @override
  State<VerifyEditSubscriptonScreen> createState() =>
      _VerifyEditSubScreenState();
}

class _VerifyEditSubScreenState extends State<VerifyEditSubscriptonScreen> {
  late int Id;
  late int subId;
  late String storeName;
  late int storeId;
  late int period;
  late String periodText = "";
  late String url = "";
  late String amountText = "";
  late double amount = 0;
  late double tax = 364000;
  late double totalCost;
  late HiveSubscription hiveSub;
  late HiveVerifySub hiveVerifySub;
  late HiveOwner hiveOwner;
  final _viewModel = SubscriptionViewModel();

  @override
  void initState() {
    hiveVerifySub = widget._hiveVerifySub;
    hiveOwner = widget._hiveOwner;
    hiveSub = widget._hiveSubscription;
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
                  _editSubscripton();
                  Get.toNamed(HomePage);
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

  void _editSubscripton() {
    SubscriptionModel subscription = SubscriptionModel(
        id: hiveSub.id,
        business_owner: hiveSub.business_owner,
        store: hiveSub.store,
        period: (hiveSub.period! + hiveVerifySub.period!),
        amount: (hiveSub.amount! + hiveVerifySub.amount!),
    );
    _viewModel.editSubscriptions(subscription);
  }
}
