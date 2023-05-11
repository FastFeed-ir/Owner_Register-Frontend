import 'package:FastFeed/utils/Hive/owner/Hive_owner.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../../header_footer/components/HF_style.dart';

class HeaderPanel extends StatefulWidget {
  HeaderPanel({Key? key}) : super(key: key);

  @override
  State<HeaderPanel> createState() => _HeaderPanelState();
}

class _HeaderPanelState extends State<HeaderPanel> {
  late HiveOwner owner;
  @override
  void initState() {
    owner = ownerBox.get('Owner');
  }
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
            width: 300.0.w,
            height: 84.0.h,
            child: Center(
              child: LogoTextStyle(
                text: 'FastFeed',
              ),
            ),
          ),
          SizedBox(
            width: 600.0.w,
            height: 72.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.toNamed(HomePage);
                  },
                  child: warpText('خانه', Icons.home_outlined),
                ),
                SizedBox(
                  width: 40.w,
                ),
                profileMenu(),
                SizedBox(
                  width: 40.w,
                ),
                subsMenu("تمدید اشتراک"),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget profileMenu() {
    return PopupMenuButton(
      child: warpText("پروفایل",Icons.person_outline,),
      onSelected: (String choice) async {
        if (choice == 'view_profile') {
          Get.toNamed(ProfilePage);
        } else if (choice == 'buy_subscription') {
          Get.toNamed(OwnerRegisterPage);
        } else if (choice == 'exit') {
          //SharedPreferences prefs = await SharedPreferences.getInstance();
          //await prefs.remove('user.api_token');
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'view_profile',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('مشاهده حساب کاربری'),
              SizedBox(width: 8.w),
              Icon(Icons.person_outline),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'buy_subscription',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ثبت فروشگاه'),
              SizedBox(width: 8.w),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'exit',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('خروج'),
              SizedBox(width: 8.w),
              Icon(Icons.exit_to_app_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget subsMenu(String? text) {
    return TextButton(
      onPressed: () => Get.toNamed(RestaurantListPage),
      style: TextButton.styleFrom(
        backgroundColor: WhiteColor,
      ),
      child: warpText(text, Icons.assignment_outlined),
    );
  }

  Widget warpText(String? text, IconData? myIcon) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: SizedBox(
                  width: 8.0.w,
                ),
              ),
              WidgetSpan(
                child: Icon(myIcon,color: BlackColor, size: 35.r),
              ),
              TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: IranSansWeb,
                  color: BlackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

