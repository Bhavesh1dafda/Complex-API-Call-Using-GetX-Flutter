import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
        designSize: Size(360, 690),
    builder: (contex,index){
      return    GetMaterialApp(

      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      );
    }
    );

  }
}
