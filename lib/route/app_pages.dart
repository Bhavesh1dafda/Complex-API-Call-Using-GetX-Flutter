import 'package:get/get.dart';
import 'package:practice/route/app_route.dart';
import 'package:practice/view/home_page.dart';
import 'package:practice/view/populationpage.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.HomePage, page: () =>  const HomePage()),
    GetPage(name: AppRoute.Validations, page: () => Validations()),
    GetPage(name: AppRoute.PopulationPage, page: () => PopulationPage()),
  ];
}
