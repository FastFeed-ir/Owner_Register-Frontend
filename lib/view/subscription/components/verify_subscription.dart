import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/contact_about_rules/components/rules.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../header_footer/components/header.dart';
import 'Sub_style.dart';

class VerifySubscriptonScreen extends StatefulWidget {
  var subscription = Get.arguments;

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
              SubBuyTextStyle(text: "9درصد مالیات بر ارزش افزوده"),
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
                onTap: () {Get.to(RulesDialog(),popGesture: isBlank, fullscreenDialog: true);},
                child: SubTitleStyle(text: "قوانین "),
              ),
              SizedBox(
                width: 10.w,
              ),
              ElevatedButton(
                onPressed: () {},
                child: SubBuyTextStyle(text: "قبول قوانین و خرید اشتراک"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(YellowColor),
                  elevation: MaterialStateProperty.all<double>(0.0),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(396.w, 70.h),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class RulesDialog extends StatelessWidget {
  const RulesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.clear),color: BlackColor),
          ],
          backgroundColor: WhiteColor,
          elevation: 0,
        ),
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Rules(),
            ],
          ),
        ),
      ),
    );
  }
}