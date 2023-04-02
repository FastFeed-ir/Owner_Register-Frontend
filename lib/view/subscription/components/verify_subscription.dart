import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/contact_about_rules/components/ACR_style.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../header_footer/components/header.dart';
import 'Sub_style.dart';

class VerifySubscriptonScreen extends StatefulWidget {
  var subscription = Get.arguments;

  VerifySubscriptonScreen({super.key});

  @override
  State<VerifySubscriptonScreen> createState() => _VerifySubScreenState();
}

class _VerifySubScreenState extends State<VerifySubscriptonScreen> {
  late String subtype = "";
  late String priceText = "";
  late int price = 0;
  late int tax = 364000;

  @override
  void initState() {
    subtype = widget.subscription[0];
    priceText = widget.subscription[1];
    price = widget.subscription[2];
    if (price == 0) tax = 0;
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
              VerifySubscripton(
                subtype: subtype,
                priceText: priceText,
                price: price,
                tax: tax,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifySubscripton extends StatelessWidget {
  late String subtype;
  late String priceText;
  late int price;
  late int tax;

  VerifySubscripton({
    required this.subtype,
    required this.priceText,
    required this.price,
    required this.tax,
  });

  @override
  Widget build(BuildContext context) {
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
              SubBuyTextStyle(text: subtype),
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
                  SubBuyTextStyle(text: "${price + tax}".seRagham()),
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
                        _buildAboutDialog(context),
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
                  Get.toNamed(SuccessfulPurchasePage,arguments: [subtype, price+tax],);
                  //Get.toNamed(UnSuccessfulPurchasePage,arguments: [subtype, price+tax],);
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
}

Widget _buildAboutDialog(BuildContext context) {
  return AlertDialog(
    title: SubTitleStyle(text: "قوانین "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PhraseStyle(text: RulesPhrase),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          'متوجه شدم',
          style: TextStyle(
            color: BlackColor,
            fontFamily: "IranSansWeb",
          ),
        ),
        style: buttonStyle_build(190, 55, 10, YellowColor),

      ),
    ],
  );
}
