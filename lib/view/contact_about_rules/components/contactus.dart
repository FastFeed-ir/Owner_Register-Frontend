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
        backgroundColor: const Color(0xFFFFFFFF),
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
        left: 150.0.r,
        top: 50.0.r,
        right: 150.0.r,
        bottom: 81.0.r,
      ),
      width: 1920.w,
      //height: 1080.0.r,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: TitleStyle(text: "ارتباط با "),
              ),
              SizedBox(
                height: 20.r,
              ),
              ContactusStyle(
                master: "  تلفن :",
                slave: Phone,
                icon: Icons.call,
              ),
              SizedBox(
                height: 10,
              ),
              ContactusStyle(
                master: "  ایمیل :",
                slave: Email,
                icon: Icons.mail,
              ),
              SizedBox(
                height: 10,
              ),
              ContactusStyle(
                master: "  آدرس :",
                slave: Address,
                icon: Icons.location_on,
              ),
              SizedBox(
                height: 10,
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
                          height: 68.r,
                          width: 68.r,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Twitter
                        },
                        child: Image.asset(
                          Twitter,
                          height: 68.r,
                          width: 68.r,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Telegram
                        },
                        child: Image.asset(
                          Telegram,
                          height: 68.r,
                          width: 68.r,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // To Do
                          // Linkedin
                        },
                        child: Image.asset(
                          Linkedin,
                          height: 68.r,
                          width: 68.r,
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
              SizedBox(height: 30.r,),
              GestureDetector(
                onTap: () {},
                child: Image.asset(Map,height: 450.r, width: 400.r,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
