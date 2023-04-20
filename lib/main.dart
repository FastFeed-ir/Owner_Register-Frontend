import 'package:FastFeed/view/categories/categories_screen.dart';
import 'package:FastFeed/view/login&signUp/component/login&signUp.dart';
import 'package:FastFeed/view/maskgroup/components/maskGroup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';
import 'view/contact_about_rules/components/about.dart';
import 'view/contact_about_rules/components/contactus.dart';
import 'view/contact_about_rules/components/rules.dart';
import 'view/home/components/homePage.dart';
import 'view/home/components/restaurant_list.dart';
import 'view/ownerRegistration/components/owner_reg_page.dart';
import 'view/subscription/components/subscription.dart';
import 'view/subscription/components/successful_purchase.dart';
import 'view/subscription/components/unsuccessful_purchase.dart';
import 'view/subscription/components/verify_subscription.dart';
import 'package:material_color_gen/material_color_gen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
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
            GetPage(name: MaskGroupPage, page: () => MaskGroupScreen()),
            GetPage(name: RulesPage, page: () => RulesScreen()),
            GetPage(name: AboutPage, page: () => AboutScreen()),
            GetPage(name: ContactUsPage, page: () => ContactUsScreen()),
            GetPage(name: HomePage, page: () => HomeScreen()),
            GetPage(
                name: OwnerRegisterPage, page: () => OwenerRegisterScreen()),
            GetPage(name: SubscriptionPage, page: () => SubscriptionScreen()),
            GetPage(
                name: VerifySubscriptonPage,
                page: () => VerifySubscriptonScreen()),
            GetPage(
                name: SuccessfulPurchasePage,
                page: () => SuccessfulPurchaseScreen()),
            GetPage(
                name: UnSuccessfulPurchasePage,
                page: () => UnSuccessfulPurchaseScreen()),
            GetPage(
              name: RestaurantListPage,
              page: () => RestaurantListScreen(),
            ),
            GetPage(
              name: CategoriesPage,
              page: () => CategoriesScreen(storeId: 1),
            ),
            GetPage(
              name: PhoneNumbePage,
              page: () => PhoneNumberDialog(),
            ),
          ],
          // title: 'FastFeed',
          initialRoute: MaskGroupPage,
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.noTransition,
          theme: ThemeData(
            primarySwatch: YellowColor.toMaterialColor(),
          ),
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
