import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/route/app_route.dart';







class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              Get.toNamed(AppRoute.Validations);
            }, child: Text('Enter & View Data')),
          )
        ],
      ),
    );
  }
}
