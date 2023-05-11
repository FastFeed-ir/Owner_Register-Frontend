import 'package:FastFeed/main.dart';
import 'package:FastFeed/utils/Hive/owner/Hive_owner.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Home_style.dart';
import 'header_panel.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HiveOwner owner = ownerBox.get('Owner');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPanel(),
              Home(owner: owner),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  Home({Key? key, required this.owner}) : super(key: key);
  HiveOwner owner;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 57.0.h,
        right: 150.0.w,
        bottom: 81.0.h,
      ),
      width: 1920.w,
      height: 1080.h,
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: AssetImage(MaskGroupimg),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 450.h,),
              SizedBox(
                width: 430.w,
                height: 130.h,
                child:
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(OwnerRegisterPage);
                    },
                    child: HomeTextStyle(text: "ثبت فروشگاه"),
                    style: buttonStyle_build(130, 100, 60, YellowColor),
                  ),
              ),
            ],
          ),
          SizedBox(width: 150.w,),
        ],
      ),
    );
  }
}


