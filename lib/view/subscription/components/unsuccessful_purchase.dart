import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../utils/constants.dart';
import 'Sub_style.dart';

class UnSuccessfulPurchaseScreen extends StatefulWidget {
  var subscription = Get.arguments;

  UnSuccessfulPurchaseScreen({super.key});

  @override
  State<UnSuccessfulPurchaseScreen> createState() => _UnSuccessfulPurchaseState();
}

class _UnSuccessfulPurchaseState extends State<UnSuccessfulPurchaseScreen> {
  late String subtype = "";
  late int price = 0;
  @override
  void initState() {
    subtype = widget.subscription[0];
    price = widget.subscription[1];
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
              //Header(),
              UnSuccessfulPurchase(
                subtype: subtype,
                price: price,
              ),
              //Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
class UnSuccessfulPurchase extends StatelessWidget {
  late String subtype;
  late int price;
  UnSuccessfulPurchase({required this.subtype, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        640.0.w,
        30.0.h,
        640.0.w,
        300.0.h,
      ),
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(OwnerPageimg),
            fit: BoxFit.fill,
        ),
      ),
      width: 1920.w,
      height: 1080.0.h,
      child: Container(
        color: Color(0xffE1D0D0),
        padding: EdgeInsets.only(left: 80.w,right: 80.w, ),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            CircleAvatar(
              backgroundColor: Color(0xffB2160C),
              child: Image.asset(Zabdar,height: 97.h, width: 97.w,),
              radius: 60.r,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PurchaseStyle(text: "پرداخت ناموفق"),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text:"نام فروشگاه :"),
                PurchaseStyle(text: "Restaurant Name"),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "مبلغ :"),
                Row(
                  children: [
                    PurchaseStyle(text: "${price}".seRagham()),
                    PurchaseStyle(text: " تومان"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "تاریخ :"),
                PurchaseStyle(text: DateTime.now().toPersianDate()),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "شناسه پرداخت :"),
                PurchaseStyle(text: "12345"),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "مدت اشتراک :"),
                PurchaseStyle(text: subtype),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ToDO Get QR Code
                  },
                  child: SubBuyTextStyle(text: "امتحان مجدد"),
                  style: buttonStyle_build(190, 55, 10, YellowColor),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ToDO Get QR Code
                  },
                  child: SubBuyTextStyle(text: "انصراف"),
                  style: buttonStyle_build(190, 55, 10, YellowColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
