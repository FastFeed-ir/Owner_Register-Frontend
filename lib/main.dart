import 'package:FastFeed/view/categories/categories_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: CategoriesScreen(
          storeId: 1,
        ),
      ),
    );
  }
}
