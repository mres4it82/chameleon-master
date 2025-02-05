import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // just bind home controller with the home view
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
  }
}
