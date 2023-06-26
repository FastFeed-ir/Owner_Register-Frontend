import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Home_style.dart';
import 'header_panel.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  int ID = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPanel(ID: ID),
              Home(ID: ID),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  Home({Key? key, required this.ID}) : super(key: key);
  int ID;
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
                      Get.toNamed(OwnerRegisterPage, arguments: ID);
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


