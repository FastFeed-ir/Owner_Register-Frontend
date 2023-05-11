import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/contact_about_rules/components/ACR_style.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/home/components/header_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../../../utils/Hive/verifySub/Hive_verifySub.dart';
import 'Sub_style.dart';

class AddSubscriptionScreen extends StatefulWidget {
  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // TODO get ID
              HeaderPanel(),
              subscription(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget subscription() {
    late Color free = Color(0xFFFFFFFF);
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 51.0.h,
        right: 150.0.w,
      ),
      width: 1920.w,
      height: 720.0.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TitleStyle(text: "خرید اشتراک "),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            itemCount: SubscriptionList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 700.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                free = YellowColor;
              } else {
                free = WhiteColor;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 800.w,
                    height: 110.h,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            SubscriptionList[index].amountText,
                            style: TextStyle(
                                color: RedColor,
                                fontSize: 28.sp,
                                fontFamily: IranSansWeb),
                          ),
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: BlackColor,
                            size: 25.r,
                          ),
                        ],
                      ),
                      // TODO
                      onTap: () {
                        verifySubBox.put(
                          "AddVerifySub",
                          HiveVerifySub(
                              periodText: SubscriptionList[index].periodText,
                              period: SubscriptionList[index].period,
                              amountText: SubscriptionList[index].amountText,
                              amount: SubscriptionList[index].amount),
                        );
                        Get.toNamed(
                          VerifyAddSubscriptonPage,
                        );
                      },
                      shape: RoundedRectangleBorder(
                        //<-- SEE HERE
                        side: BorderSide(width: 2.w),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      leading: Text(
                        SubscriptionList[index].periodText,
                        style: TextStyle(
                            color: BlackColor,
                            fontSize: 28.sp,
                            fontFamily: IranSansWeb),
                      ),
                      tileColor: free,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
