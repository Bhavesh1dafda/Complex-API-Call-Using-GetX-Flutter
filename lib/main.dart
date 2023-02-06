import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/route/app_pages.dart';
import 'package:practice/view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
