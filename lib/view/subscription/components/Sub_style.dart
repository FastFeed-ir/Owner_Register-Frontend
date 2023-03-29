import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTypeTextStyle extends StatelessWidget {
  final String text;

  const SubTypeTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'IranSansWeb',
        color: RedColor,
      ),
    );
  }
}
class SubscriptionItem{
  late String deadline;
  late String priceText;
  late int price;
  SubscriptionItem(this.deadline, this.priceText, this.price,);

}
List<SubscriptionItem> SubscriptionList =[
  SubscriptionItem("اشتراک 1 ماهه\t (ویژه کاربران جدید)" , "0 (رایگان)" , 0,),
  SubscriptionItem("اشتراک 3 ماهه" , "3 میلیون تومان" , 3000000,),
  SubscriptionItem("اشتراک 6 ماهه" , "6 میلیون تومان" , 6000000,),
  SubscriptionItem("اشتراک 1 ساله" , "10 میلیون تومان" , 10000000,),
];
class SubTitleStyle extends StatelessWidget {
  final String text;

  const SubTitleStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 36.0.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'IranSansWeb',
          color: BlackColor,
        ),
        children: [
          TextSpan(
            text: AppName,
            style: TextStyle(
              fontSize: 36.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'IranSansWeb',
              color: RedColor,
            ),
          ),
        ],
      ),
    );
  }
}
class SubBuyTextStyle extends StatelessWidget {
  final String text;

  const SubBuyTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'IranSansWeb',
        color: BlackColor,
      ),
    );
  }
}