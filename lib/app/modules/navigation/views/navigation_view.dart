import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shrimp Farm Data'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 55, 191, 125),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'No',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Date',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Time',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'turbidity',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'pH',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Temp',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.sensorDataRef.once(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return FirebaseAnimatedList(
                    query: FirebaseDatabase.instance.ref().child('sensorData'),
                    itemBuilder: (context, snapshot, animation, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal:
                                BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              snapshot.child('tanggal').value.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              snapshot.child('waktu').value.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              snapshot.child('kekeruhan').value.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              snapshot.child('pH').value.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              snapshot.child('temperature').value.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
