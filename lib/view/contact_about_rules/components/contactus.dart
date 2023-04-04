import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/header_footer/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ACR_style.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              ContactUs(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 50.0.h,
        right: 150.0.w,
        bottom: 81.0.h,
      ),
      width: 1920.w,
      height: 600.0.h,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: TitleStyle(text: "ارتباط با "),
              ),
              SizedBox(
                height: 20.h,
              ),
              ContactusStyle(
                master: "  تلفن :",
                slave: Phone,
                icon: Icons.call,
              ),
              SizedBox(
                height: 10.h,
              ),
              ContactusStyle(
                master: "  ایمیل :",
                slave: Email,
                icon: Icons.mail,
              ),
              SizedBox(
                height: 10.h,
              ),
              ContactusStyle(
                master: "  آدرس :",
                slave: Address,
                icon: Icons.location_on,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactusStyle(
                    master: "  شبکه های اجتماعی :",
                    slave: "",
                    icon: Icons.campaign,
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Wrap(
                    spacing: 70.r,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Instagram
                        },
                        child: Image.asset(
                          Instagram,
                          height: 68.h,
                          width: 68.w,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Twitter
                        },
                        child: Image.asset(
                          Twitter,
                          height: 68.h,
                          width: 68.w,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Telegram
                        },
                        child: Image.asset(
                          Telegram,
                          height: 68.h,
                          width: 68.w,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Linkedin
                        },
                        child: Image.asset(
                          Linkedin,
                          height: 68.h,
                          width: 68.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 230.w,),
          Column(
            children: [
              SizedBox(height: 30.h,),
              GestureDetector(
                onTap: () {},
                child: Image.asset(Map,height: 400.r, width: 400.r,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
