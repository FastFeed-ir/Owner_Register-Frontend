import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/contact_about_rules/components/ACR_style.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/header_footer/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              About(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        150.0.r,
        57.0.r,
        150.0.r,
        81.0.r,
      ),
      width: 1920.w,
      //height: 1080.0.r,
      child: Column(
        children: [
          Row(
            children: [
              TitleStyle(text:"درباره "),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              PhraseStyle(text:AboutUsPhrase),
            ],
          ),
        ],
      ),
    );
  }
}