import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../model/entity/subscription_model.dart';
import '../../../view_model/subscription_viewmodel.dart';
import '../../header_footer/components/header.dart';
import 'Sub_style.dart';

class VerifySubscriptonScreen extends StatefulWidget {
  var subscription = Get.arguments;

  VerifySubscriptonScreen({super.key});

  @override
  State<VerifySubscriptonScreen> createState() => _VerifySubScreenState();
}

class _VerifySubScreenState extends State<VerifySubscriptonScreen> {
  late int storeName;
  late bool isEdit;
  late String period = "";
  late String priceText = "";
  late double price = 0;
  late double tax = 364000;
  late double totalCost;
  late List<dynamic> pageType;
  final _viewModel = SubscriptionViewModel();

  @override
  void initState() {
    // TODO isEdit, storeId
    priceText = widget.subscription[0];
    period = widget.subscription[1];
    priceText = widget.subscription[2];
    price = widget.subscription[3];
    if (price == 0) tax = 0;
    totalCost = price + tax;
    pageType = widget.subscription[4];
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
              Header(),
              verifySubscripton(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
  Widget verifySubscripton(){
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
              SubBuyTextStyle(text: period),
              SubBuyTextStyle(text: priceText),
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
                    builder: (BuildContext context) => buildInfoDialog(context, "قوانین ", RulesPhrase),
                  );
                },
                child: SubTitleStyle(text: "قوانین "),
              ),
              SizedBox(
                width: 10.w,
              ),
              ElevatedButton(
                onPressed: () {
                  // ToDo Get To Bank Gateway then Get To SuccessfulPurchase or UnSuccessfulPurchasePage
                  if(pageType[0] == 1){ // Store
                    _addSubscripton();
                    // Store store = pageType[1];
                    // store.title
                    // TODO send Store Api with add function
                    Get.toNamed(SuccessfulPurchasePage,arguments: [period, totalCost, /*store.title*/],);
                  }else{ // revival
                    _editSubscripton();
                    Get.toNamed(HomePage);
                  }
                  //Get.toNamed(UnSuccessfulPurchasePage,arguments: [period, price+tax],);
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
  var period = this.period;
  var price = this.price;
    if (period.isNotEmpty && price >= 0) {
      SubscriptionModel subscription = SubscriptionModel(
        period: period,
        price: totalCost,
      );
      _viewModel.addSubscriptions(subscription);
      Navigator.pop(context);
    }
  }
  void _editSubscripton() {
    var period = this.period;
    var price = this.price;
    if (period.isNotEmpty && price >= 0) {
      SubscriptionModel subscription = SubscriptionModel(
        period: period,
        price: totalCost,
      );
      _viewModel.editSubscriptions(subscription);
      Navigator.pop(context);
    }
  }
}