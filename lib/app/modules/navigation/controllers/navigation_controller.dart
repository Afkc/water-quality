import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController

  final DatabaseReference sensorDataRef =
      FirebaseDatabase.instance.ref().child('sensorData');

  var sensorData = {}.obs;

  void updateSensorData(Map<dynamic, dynamic> newData) {
    sensorData.value = newData;
  }

  @override
  void onInit() {
    super.onInit();
    // Mendengarkan perubahan pada Firebase Realtime Database
    sensorDataRef.onValue.listen((event) {
      var data = event.snapshot.value;
      if (data != null) {
        // Memperbarui data sensor saat ada perubahan
        if (data is Map<dynamic, dynamic>) {
           updateSensorData(Map<String, dynamic>.from(data));
         }
      }
    });
  }
}
