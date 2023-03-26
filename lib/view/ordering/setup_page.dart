import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'ordering_page.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var resturant = '';

    proceed() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OrderPage(code: resturant),
      ));
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("ثبت سفارش تستی"),
          titleTextStyle: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: size.width * 0.6,
              child: TextField(
                textDirection: ui.TextDirection.rtl,
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (s) {
                  resturant = s;
                },
                onSubmitted: (s) => proceed(),
                decoration: const InputDecoration(
                  hintText: 'کد رستوران را وارد کنید...',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => proceed(),
                child: const Text(
                  'ورود',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: size.height * 0.3),
          ],
        ),
      ),
    );
  }
}
