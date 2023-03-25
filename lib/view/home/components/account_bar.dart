import 'package:flutter/material.dart';

class AccountBar extends StatefulWidget {
  const AccountBar({super.key});

  @override
  AccountBarState createState() => AccountBarState();
}

class AccountBarState extends State<AccountBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: accountBar(),
    );
  }

  Widget accountBar() {
    return PopupMenuButton(
      icon: const Icon(Icons.person_outline),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'view_profile',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('مشاهده حساب کاربری'),
              SizedBox(width: 8),
              Icon(Icons.person_outline),
            ],
          ),
          onTap: () {
            //TODO on click profile page
          },
        ),
        PopupMenuItem(
          value: 'buy_subscription',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('خرید اشتراک'),
              SizedBox(width: 8),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),
          onTap: () {
            //TODO on click buy subscription page
          },
        ),
        PopupMenuItem(
          value: 'exit',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('خروج'),
              SizedBox(width: 8),
              Icon(Icons.exit_to_app_outlined),
            ],
          ),
          onTap: () {
            //TODO on click exit
          },
        ),
      ],
    );
  }
}
