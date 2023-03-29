import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'HF_style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        150.0.r,
        12.0.r,
        143.0.r,
        12.0.r,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFACA1A1),
          ),
        ),
      ),
      width: 1920.w,
      height: 101.0.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 266.0.r,
            height: 84.0.r,
            child: LogoTextStyle(text:'FastFeed',),
          ),
          SizedBox(
            width: 684.0.w,
            height: 72.0.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(onTap: (){Get.toNamed(MaskGroupPage);}, child: HTextStyle(text: 'خانه',),),
                GestureDetector(onTap: (){Get.toNamed(RulesPage);}, child: HTextStyle(text: 'قوانین',),),
                GestureDetector(onTap: (){Get.toNamed(AboutPage);}, child: HTextStyle(text: 'درباره ما',),),
                GestureDetector(onTap: (){Get.toNamed(ContactUsPage);}, child: HTextStyle(text: 'ارتباط با ما',),),
                SizedBox(
                  width: 257.0.r,
                  height: 72.0.r,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SubscriptionPage);
                    },
                    style: buttonStyle_build(257, 72, 10, YellowColor),
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
