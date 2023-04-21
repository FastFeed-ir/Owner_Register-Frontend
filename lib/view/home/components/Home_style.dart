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

Widget restaurantTitle(String? name, String? RestaurantLogo, String? startDate, int? period) {
  Jalali startJal = _stringToJal(startDate);
  Jalali finishJal = _finishDate(startJal, period);
  int year = finishJal.year;
  int month = finishJal.month;
  int day = finishJal.day;
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
            child: Image.asset(
              RestaurantLogo!,
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
            ("شروع اشتراک: " +startDate!),
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
          Text(("پایان اشتراک: "+"${year.toString().toPersianDigit()}/${month.toString().toPersianDigit()}/${day.toString().toPersianDigit()}"),
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

Jalali _stringToJal(String? startDate) {
  List<String> parts = startDate!.split('/');
  int shamsiYear = int.parse(parts[0]);
  int shamsiMonth = int.parse(parts[1]);
  int shamsiDay = int.parse(parts[2]);
  Jalali shamsiDate = Jalali(shamsiYear, shamsiMonth, shamsiDay);
  return shamsiDate;
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
