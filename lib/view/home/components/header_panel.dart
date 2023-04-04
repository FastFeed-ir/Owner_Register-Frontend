import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../header_footer/components/HF_style.dart';

class HeaderPanel extends StatelessWidget {
  const HeaderPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        150.0.w,
        12.0.h,
        143.0.w,
        12.0.h,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFACA1A1),
          ),
        ),
      ),
      width: 1920.w,
      height: 101.0.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 266.0.w,
            height: 84.0.h,
            child: Center(child: LogoTextStyle(text:'FastFeed',)),
          ),
          SizedBox(
            width: 684.0.w,
            height: 72.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //GestureDetector(onTap: (){Get.toNamed(MaskGroupPage);}, child: HTextStyle(text: 'خانه',),),
                GestureDetector(onTap: (){Get.toNamed(RulesPage);}, child: HTextStyle(text: 'قوانین',),),
                GestureDetector(onTap: (){Get.toNamed(AboutPage);}, child: HTextStyle(text: 'درباره ما',),),
                GestureDetector(onTap: (){Get.toNamed(ContactUsPage);}, child: HTextStyle(text: 'ارتباط با ما',),),
                profileMenu(),
                SizedBox(
                  width: 200.0.w,
                  height: 72.0.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SubscriptionPage);
                    },
                    style: buttonStyle_build(200, 72, 10, YellowColor),
                    child: HTextStyle(text: 'اشتراک',),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget profileMenu() {
  return PopupMenuButton(
    icon: const Icon(Icons.person_outline),
    itemBuilder: (BuildContext context) => [
      PopupMenuItem(
        value: 'view_profile',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('مشاهده حساب کاربری'),
            SizedBox(width: 8),
            Icon(Icons.person_outline),
          ],
        ),
        onTap: () {
          //TODO on click profile page
        },
      ),
      PopupMenuItem(
        value: 'buy_subscription',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('خرید اشتراک'),
            SizedBox(width: 8),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
        onTap: () {
          //TODO on click buy subscription page
        },
      ),
      PopupMenuItem(
        value: 'exit',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('خروج'),
            SizedBox(width: 8),
            Icon(Icons.exit_to_app_outlined),
          ],
        ),
        onTap: () {
          //TODO on click exit
        },
      ),
    ],
  );
}
