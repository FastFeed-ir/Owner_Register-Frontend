import 'package:FastFeed/model/entity/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';
import '../../../view_model/subscription_viewmodel.dart';
import '../../header_footer/components/footer.dart';
import 'Home_style.dart';
import 'header_panel.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({Key? key,}) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  final List<SubscriptionModel> _restaurants = [];
  final _viewModel = SubscriptionViewModel();
  @override
  initState() {
    getSubscripton();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPanel(),
              restaurantList(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget restaurantList() {
    // TODO: implement build
    if(Restaurants.isEmpty){
      return Container(
        padding: EdgeInsets.only(
          left: 150.0.w,
          top: 51.0.h,
          right: 150.0.w,
        ),
        width: 1920.w,
        height: 700.h,
        child: Center(
          //TODO Empty list dialog
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(SadFace,width: 200.w,height: 200.h,),
              SizedBox(height: 10.h,),
              RestaurantTextStyle(text: "اشتراکی وجود ندارد"),
            ],
          ),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 51.0.h,
        right: 150.0.w,
      ),
      width: 1920.w,
      height: ((300 * Restaurants.length)+300).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            itemCount: Restaurants.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 700.w,),
            itemBuilder: (BuildContext context, int index) {
              // TODO loaing
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    // ToDo get name from API
                    title: restaurantTitle(Restaurants[index].name, Restaurants[index].logoImg, Restaurants[index].date),
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      side: BorderSide(width: 2.w),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 20.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(onPressed: (){}, child: SubButtonTextStyle(text: 'تغییر منو',),style: buttonStyle_build(300, 70, 20, YellowColor),),
                            ElevatedButton(onPressed: (){}, child: SubButtonTextStyle(text: 'تمدید اشتراک',),style: buttonStyle_build(300, 70, 20, YellowColor),),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  void getSubscripton() {
    _viewModel.getSubscriptions();
    _viewModel.subscriptions.stream.listen((list) {
      setState(() {
        _restaurants.addAll(list);
      });
    });
  }
}
