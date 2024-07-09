import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController
  Rx<DateTime> hari = DateTime.now().obs;
  RxString currentTime = "".obs;
  RxList<Map<dynamic, dynamic>> sensorDataList = <Map<dynamic, dynamic>>[].obs;

  
  final databaseRef = FirebaseDatabase.instance.ref().child('sensorData');

  @override
  void onInit() {
    super.onInit();
    displayDate();
    displayDay();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateTime();
    });
    // databaseRef.onValue.listen((event) {
    //   if (event.snapshot.value != null) {
    //     // Mendapatkan data dari snapshot dan menyimpannya dalam sensorDataList
    //     Map<dynamic, dynamic> sensorData = event.snapshot.value;
    //     sensorDataList.assignAll(sensorData.entries.toList());
    //   }
    // });
  }

  String displayDay() {
    return DateFormat('EEEE', 'en_US').format(DateTime.now());
  }

  String displayDate() {
    return DateFormat('d MMMM y', 'en_US').format(DateTime.now());
  }

  void _updateTime() {
    currentTime.value = DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  void onReady() {
    super.onReady();

    update();
  }

  

}
