

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'component/information_card.dart';
import 'component/welcome_text.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aqua Guard Sentinel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: welcome(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: StreamBuilder(
                stream: FirebaseDatabase.instance.ref().child('data').onValue,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Text('No data available');
                  } else {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.displayDay(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      controller.displayDate(),
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Obx(
                                      () => Text(
                                        controller.currentTime.value,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )),
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Pool Data',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                          ],
                        ),
                        information_card(
                          need: snapshot.data!.snapshot.value['pH'].toString(),
                          title: 'water pH',
                          icon: Icons.water_drop_outlined,
                          color: Colors.cyan.withOpacity(0.5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        information_card(
                          need: snapshot.data!.snapshot.value['temperature']
                              .toString(),
                          title: 'Temperature',
                          icon: Icons.dew_point,
                          color: const Color.fromARGB(255, 238, 41, 74).withOpacity(0.5),
                          
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        information_card(
                          need:
                              '${snapshot.data!.snapshot.value['kekeruhan']} ',
                          title: 'Water Turbidity',
                          icon: Icons.waves_outlined,
                          color: Colors.orangeAccent.withOpacity(0.8),
                        ),
                        const SizedBox(height: 10,),
                        const SizedBox(
                          height: 100,)
                        
                      ],
                    );
                  }
                }),
          )
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: Get.width * 0.3,
            child: FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                Get.toNamed(Routes.NAVIGATION);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  ),
              backgroundColor: const Color.fromARGB(255, 55, 191, 125),
              child: const Icon(
                Icons.document_scanner_outlined,
                size: 30,
                color: Colors.white,
              )
            ),
          ),
          SizedBox(
            width: Get.width * 0.3,
            child: FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                Get.toNamed(Routes.PH);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  ),
              backgroundColor: const Color.fromARGB(255, 55, 191, 125),
              child: const Icon(
                Icons.data_exploration,
                size: 30,
                color: Colors.white,
              )
            ),
          ),
        ],
      ),
    );
  }
}
