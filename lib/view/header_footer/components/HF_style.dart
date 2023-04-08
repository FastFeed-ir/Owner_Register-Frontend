import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HTextStyle extends StatelessWidget {
  final String text;

  const HTextStyle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}
class LogoTextStyle extends StatelessWidget {
  final String text;

  const LogoTextStyle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: FugazOne,
        fontSize: 56.0.sp,
        fontWeight: FontWeight.bold,
        color: RedColor,
      ),

      textDirection: TextDirection.ltr,
    );
  }
}
class FTextStyle extends StatelessWidget {
  final String text;

  const FTextStyle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}