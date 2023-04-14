import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeTextStyle extends StatelessWidget {
  final String text;

  const HomeTextStyle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 50.sp,
        fontFamily: IranSansWeb,
        color: RedColor,
      ),
    );
  }
}

class SubButtonTextStyle extends StatelessWidget {
  final String text;

  const SubButtonTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28.sp,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}

Widget restaurantTitle(String? name, String? RestaurantLogo, String? date) {
  return Wrap(
    children: [
      Column(
        children: [
          Image.asset(
            RestaurantLogo!,
            height: 150.h,
            width: 150.w,
          ),
        ],
      ),
      SizedBox(
        width: 20.w,
      ),
      Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            name!,
            style: TextStyle(
              fontSize: 32.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            ("پایان اشتراک : " + date!),
            style: TextStyle(
              fontSize: 32.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
        ],
      ),
    ],
  );
}

class RestaurantTextStyle extends StatelessWidget {
  final String text;

  const RestaurantTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 38.sp,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}

class RestaurantSubs {
  String? name;
  String? logoImg;
  String? date;

  // TODO get SubModel
  RestaurantSubs({
    required this.name,
    required this.logoImg,
    required this.date,
  });
}