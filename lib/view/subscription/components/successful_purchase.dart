import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../utils/constants.dart';
import 'Sub_style.dart';

class SuccessfulPurchaseScreen extends StatefulWidget {
  var subscription = Get.arguments;

  SuccessfulPurchaseScreen({super.key});

  @override
  State<SuccessfulPurchaseScreen> createState() => _SuccessfulPurchaseState();
}

class _SuccessfulPurchaseState extends State<SuccessfulPurchaseScreen> {
  late String period = "";
  late int price = 0;
  late String storeName;

  @override
  void initState() {
    period = widget.subscription[0];
    price = widget.subscription[1];
    storeName = widget.subscription[2];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              successfulPurchase(),
            ],
          ),
        ),
      ),
    );
  }

  Widget successfulPurchase() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        640.0.w,
        30.0.h,
        640.0.w,
        70.0.h,
      ),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(OwnerPageimg), fit: BoxFit.cover),
      ),
      width: 1920.w,
      height: 1080.0.h,
      child: Container(
        color: Color(0xffD2E1D0),
        padding: EdgeInsets.only(left: 80.w, right: 80.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            CircleAvatar(
              backgroundColor: GreenColor,
              child: Image.asset(
                Tick,
                height: 97.h,
                width: 97.w,
              ),
              radius: 60.r,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PurchaseStyle(text: "پرداخت موفق"),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "نام فروشگاه :"),
                // ToDO Set Restaurant Name
                PurchaseStyle(text: storeName,),
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
                PurchaseStyle(text: period),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                Image.asset(
                  Qrsample,
                  height: 200.h,
                  width: 200.w,
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    // ToDO Get QR Code
                  },
                  child: SubBuyTextStyle(text: "دریافت QR"),
                  style: buttonStyle_build(396, 70, 10, YellowColor),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
