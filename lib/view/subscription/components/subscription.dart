import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/contact_about_rules/components/ACR_style.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/header_footer/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Sub_style.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Subscription(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Subscription extends StatelessWidget {
  late Color free = Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.r,
        top: 51.0.r,
        right: 150.0.r,
      ),
      width: 1920.w,
      //height: 1080.0.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TitleStyle(text: "خرید اشتراک "),
          ),
          SizedBox(
            height: 20.r,
          ),
          ListView.builder(
            itemCount: SubscriptionList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 700.r,),
            itemBuilder: (BuildContext context, int index) {
              if(index == 0) {
                free = YellowColor;
              } else {
                free = Color(0xFFFFFFFF);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 800.w,
                    height: 110.r,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            SubscriptionList[index].priceText,
                            style: TextStyle(color: RedColor, fontSize: 28.sp,fontFamily: "IranSansWeb"),
                          ),
                          Icon(Icons.arrow_back_ios_new_rounded, color: BlackColor, size: 25.r,),
                        ],
                      ),
                      // TO DO
                      onTap: () {
                        // SubscriptionList[index].price for price
                        print(SubscriptionList[index].price);
                      },
                      shape: RoundedRectangleBorder(
                        //<-- SEE HERE
                        side: BorderSide(width: 2.w),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      leading:Text(
                        SubscriptionList[index].deadline,
                        style: TextStyle(color: BlackColor, fontSize: 28.sp,fontFamily: "IranSansWeb"),
                      ),
                      tileColor: free,
                    ),
                  ),
                  SizedBox(height: 20.r,),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
