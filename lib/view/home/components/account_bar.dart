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
    return Material(
      color: Colors.white,
      elevation: 8.0,
      shadowColor: Colors.grey,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                //TODO on click profile page
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "مشاهده حساب کاربری",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.person_outline)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //TODO on click buy subscription page
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "خرید اشتراک",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //TODO on click exit
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "خروج",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.exit_to_app_outlined)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget accountBarChat() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'buy_subscription',
          child: Row(
            children: const [
              Icon(Icons.payment),
              SizedBox(width: 8),
              Text('Buy Subscription'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'view_profile',
          child: Row(
            children: const [
              Icon(Icons.person),
              SizedBox(width: 8),
              Text('View Profile'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'exit',
          child: Row(
            children: const [
              Icon(Icons.exit_to_app),
              SizedBox(width: 8),
              Text('Exit'),
            ],
          ),
        ),
      ],
    );
  }
}
