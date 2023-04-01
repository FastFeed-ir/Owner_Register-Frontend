import 'package:FastFeed/view/categories/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'utils/constants.dart';
import 'package:FastFeed/view/maskgroup/components/maskGroup.dart';
import 'view/contact_about_rules/components/about.dart';
import 'view/contact_about_rules/components/contactus.dart';
import 'view/contact_about_rules/components/rules.dart';
import 'view/ownerRegistration/components/owner_reg_page.dart';
import 'view/subscription/components/subscription.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920.0, 1080.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: [
            GetPage(name: MaskGroupPage, page: ()=> MaskGroupScreen()),
            GetPage(name: RulesPage, page: ()=> RulesScreen()),
            GetPage(name: AboutPage, page: ()=> AboutScreen()),
            GetPage(name: ContactUsPage, page: ()=> ContactUsScreen()),
            GetPage(name: OwnerRegisterPage, page: ()=> OwenerRegisterScreen()),
            GetPage(name: SubscriptionPage, page: ()=> SubscriptionScreen()),
          ],
          // title: 'FastFeed',
          initialRoute: MaskGroupPage,
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.noTransition,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}
