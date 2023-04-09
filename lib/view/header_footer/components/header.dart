import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FastFeed/view/login&signUp/component/login&signUp.dart';
import 'package:get/get.dart';
import 'HF_style.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
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
                GestureDetector(onTap: (){Get.toNamed(MaskGroupPage);}, child: HTextStyle(text: 'خانه',),),
                GestureDetector(onTap: (){Get.toNamed(RulesPage);}, child: HTextStyle(text: 'قوانین',),),
                GestureDetector(onTap: (){Get.toNamed(AboutPage);}, child: HTextStyle(text: 'درباره ما',),),
                GestureDetector(onTap: (){Get.toNamed(ContactUsPage);}, child: HTextStyle(text: 'ارتباط با ما',),),
                SizedBox(
                  width: 257.0.w,
                  height: 72.0.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Get.toNamed(HomePage);
                      final String? phoneNumber = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return PhoneNumberDialog();
                        },
                      );
                      print(phoneNumber);
                    },
                    style: buttonStyle_build(257, 72, 10, YellowColor),
                    child: HTextStyle(text: 'ورود / عضویت',),
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
