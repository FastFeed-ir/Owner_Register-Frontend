import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


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
        /*  getPages: [
            GetPage(name: HomePage, page: ()=> HomeScreen()),
            GetPage(name: RulesPage, page: ()=> RulesScreen()),
            GetPage(name: AboutPage, page: ()=> AboutScreen()),
            GetPage(name: ContactUsPage, page: ()=> ContactUsScreen()),
            GetPage(name: SubscriptionPage, page: ()=> SubscriptionScreen()),
          ],
          */
          // title: 'FastFeed',
          initialRoute: "/homePage",
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.fade,
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
