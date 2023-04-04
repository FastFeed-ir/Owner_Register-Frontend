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
