import 'dart:convert';
import '../model/datamodel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DataController extends GetxController {
  var movielist = <ExchangeRate>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    populationData();
  }

  void populationData() async {
    var response =
        await http.get(Uri.parse("https://api.openbrewerydb.org/breweries/"));
    if (response.statusCode == 200) {
      var convertedData = jsonDecode(response.body);
      print(convertedData);
      List<dynamic> body = convertedData;
      movielist.value =
          body.map((dynamic item) => ExchangeRate.fromJson(item)).toList();

      update();
      isLoading.value = false;
    } else {
      return null;
    }
  }
}
