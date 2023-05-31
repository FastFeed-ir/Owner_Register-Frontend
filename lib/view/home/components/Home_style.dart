import 'dart:convert';

import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';

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

  SubButtonTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}

Widget restaurantTitle(String? name, String? RestaurantLogo, String? cratedAt, int? period) {
  List<String>? dateHour = cratedAt?.split(' ') ;
  String startDate = dateHour![0];
  var date = startDate.split('/');
  int startYear = int.parse(date[0]);
  int startMonth = int.parse(date[1]);
  int startDay = int.parse(date[2]);
  Jalali startJal = Jalali(startYear, startMonth, startDay);
  Jalali finishJal = _finishDate(startJal, period);
  int finishYear = finishJal.year;
  int finishMonth = finishJal.month;
  int finishDay = finishJal.day;
  int remainingDays = _remainingDays(Jalali.now(), finishJal);
  double percent = (1.0 * (remainingDays) / period!);
  return Wrap(
    alignment: WrapAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            padding: EdgeInsets.only(top: 30.h),
            alignment: Alignment.center,
            child: RestaurantLogo != null
            ? ClipRRect(
              borderRadius:
              BorderRadius.circular(
                  8),
              child: Image.memory(
                base64.decode(RestaurantLogo),
                fit: BoxFit.cover,
                width: 100,
                height: 85,
              ),
            )
            :Image.asset(
              RestaurantLogoDef,
              height: 200.h,
              width: 200.w,
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            name!,
            style: TextStyle(
              fontSize: 32.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            (" شروع اشتراک: ${startYear.toString().toPersianDigit()}/${startMonth.toString().toPersianDigit()}/${startDay.toString().toPersianDigit()}"),
            style: TextStyle(
              fontSize: 26.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text((" پایان اشتراک: ${finishYear.toString().toPersianDigit()}/${finishMonth.toString().toPersianDigit()}/${finishDay.toString().toPersianDigit()}"),
            style: TextStyle(
              fontSize: 28.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          circularPercent(remainingDays, percent),
        ],
      ),

    ],
  );
}

Widget circularPercent(int remainingDays, double percent) {
  return Container(
    width: 200.w,
    height: 200.h,
    padding: EdgeInsets.only(left: 10.w),
    alignment: Alignment.centerLeft,
    child: CircularPercentIndicator(
      radius: 90.0.r,
      lineWidth: 20.0.w,
      animation: true,
      percent: percent,
      center: Text(
        "${remainingDays.toString().toPersianDigit()} روز باقی مانده ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0.sp,
          fontFamily: IranSansWeb,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: YellowColor,
    ),
  );
}

Jalali _finishDate(Jalali? startDate, int? day) {
  Jalali finishDate = startDate! + day!;
  return finishDate;
}

int _remainingDays(Jalali startDate, Jalali finishDate) {
  int daysDifference = finishDate.distanceFrom(startDate);
  return daysDifference;
}

class RestaurantTextStyle extends StatelessWidget {
  final String text;

  const RestaurantTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 34.sp,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}
