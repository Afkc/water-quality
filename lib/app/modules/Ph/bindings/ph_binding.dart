import 'package:get/get.dart';

import '../controllers/ph_controller.dart';

class PhBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhController>(
      () => PhController(),
    );
  }
}
