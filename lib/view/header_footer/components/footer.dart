import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'HF_style.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.r,
        top: 30.0.r,
        right: 143.0.r,
        //12.0.r,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFACA1A1),
          ),
        ),
      ),
      width: 1920.w,
      height: 335.0.r,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(FastfeedLogo,height: 185.r,width: 171.w,),
                    ),
                    SizedBox(width: 30.w,),
                    Expanded(
                      child: Image.asset(ENamad, height: 220.r,width: 150.w,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AboutPage);
                    },
                    child: FTextStyle(
                      text: 'درباره فست فید',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RulesPage);
                    },
                    child: FTextStyle(
                      text: 'قوانین سایت',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(OwnerRegisterPage);
                    },
                    child: FTextStyle(
                      text: 'ثبت نام فروشندگان',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: FTextStyle(text: "تلفن :" + "\t\t\t\t" + Phone),
                ),
                Expanded(
                  child: FTextStyle(text: "ایمیل :" + "\t\t\t\t" + Email),
                ),
                Expanded(
                  child: FTextStyle(text: "آدرس :" + "\t\t\t\t" + Address),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // To DO
                            //go to Instagram
                          },
                          child: Image.asset(Instagram,height: 40.r, width: 40.r,),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // To DO
                            //go to Twitter
                          },
                          child: Image.asset(Twitter,height: 40.r, width: 40.r,),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // To DO
                            //go to Telegram
                          },
                          child: Image.asset(Telegram,height: 40.r, width: 40.r,),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // To DO
                            //go to Linkedin
                          },
                          child: Image.asset(Linkedin,height: 40.r, width: 40.r,),
                        ),
                      ),
                    ],
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
