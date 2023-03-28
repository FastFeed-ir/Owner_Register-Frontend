import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../header_footer/components/footer.dart';
import '../../header_footer/components/header.dart';
import 'package:FastFeed/utils/constants.dart';
class MaskGroupScreen extends StatelessWidget {
  const MaskGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              MaskGroup(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MaskGroup extends StatelessWidget {
  const MaskGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.r,
        top: 57.0.r,
        right: 150.0.r,
        bottom: 81.0.r,
      ),
      width: 1920.w,
      height: 1080.r,
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: AssetImage(MaskGroupimg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
