import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final DatabaseReference _sensorDataRef =
      FirebaseDatabase.instance.ref().child('sensorData');

  Future<Stream<dynamic>> getSensorData() async {
    return _sensorDataRef.onValue;
  }
}
