import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iot_ph/app/data/model/quality_model.dart';

class PhController extends GetxController {
  Future<List<Quality>> qualityJson() async {
    String data = await rootBundle.loadString('assets/data/excel.json');
    List mapData = json.decode(data);
    List<Quality> qualityList =
        mapData.map((quality) => Quality.fromJson(quality)).toList();
    return qualityList;
  }

  String convertToEnglish(String value) {
    switch (value) {
      case 'Buruk':
        return 'Bad';
      case 'Bagus':
        return 'Good';
      default:
        return value;
    }
  }

  @override
  void onInit() {
    super.onInit();
    qualityJson();
  }
}
